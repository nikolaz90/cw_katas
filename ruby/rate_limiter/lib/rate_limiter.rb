# frozen_string_literal: true

# RateLimiter stores user request timestamps in a window
class RateLimiter
  def initialize(limit: 0, window_in_seconds: 0)
    @limit = limit
    @window = window_in_seconds
    @store = Hash.new { |h, k| h[k] = [] }
  end

  def allow?(user:, timestamp: Time.now.to_i)
    user_requests = @store["RateLimiter___#{user}"]

    clean_up_stale_requests_from_window(user_requests, timestamp)

    return false if limit_reached_for_window?(user_requests)

    push_request_into_window(user_requests, timestamp)

    true
  end

  private

  def clean_up_stale_requests_from_window(user_requests, timestamp)
    user_requests.reject! { |ts| ts < (timestamp - @window) }
  end

  def limit_reached_for_window?(user_requests)
    user_requests.length >= @limit
  end

  def push_request_into_window(user_requests, timestamp)
    user_requests << timestamp
  end
end
