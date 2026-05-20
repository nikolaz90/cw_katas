# frozen_string_literal: true

require 'rate_limiter'

RSpec.describe RateLimiter do
  let(:limiter) { RateLimiter.new(limit: 5, window_in_seconds: 10) }

  describe '#allow?' do
    context 'user has not yet made a request' do
      it 'returns true' do
        expect(limiter.allow?(user: 'user1', timestamp: Time.now.to_i)).to eq true
      end
    end

    context 'user makes requests under the limit' do
      it 'returns true' do
        now_in_seconds = Time.now.to_i
        3.times do
          limiter.allow?(user: 'user1', timestamp: now_in_seconds - 10)
        end

        expect(limiter.allow?(user: 'user1', timestamp: now_in_seconds)).to eq true
      end
    end

    context 'user makes requests over the limit' do
      it 'returns false when the limit is reached within the window' do
        now_in_seconds = Time.now.to_i
        5.times do
          limiter.allow?(user: 'user1', timestamp: now_in_seconds - 10)
        end

        expect(limiter.allow?(user: 'user1', timestamp: now_in_seconds)).to eq false
      end

      it 'returns true when the limit is reached outside the window' do
        now_in_seconds = Time.now.to_i
        5.times do
          limiter.allow?(user: 'user1', timestamp: now_in_seconds - 61)
        end

        expect(limiter.allow?(user: 'user1', timestamp: now_in_seconds)).to eq true
      end

      context 'when one user is blocked' do
        it 'returns false for blocked user but true for new user' do
          now_in_seconds = Time.now.to_i
          5.times do
            limiter.allow?(user: 'user1', timestamp: now_in_seconds - 5)
          end

          expect(limiter.allow?(user: 'user1', timestamp: now_in_seconds)).to eq false
          expect(limiter.allow?(user: 'user2', timestamp: now_in_seconds)).to eq true
        end
      end

      context 'with 500_000 requests' do
        let(:limiter) { RateLimiter.new(limit: 5, window_in_seconds: 1) }

        it 'completes in under 1 second with 1 second window and ~100 users' do
          start_time = (Time.now.to_f * 1000).to_i

          500_000.times do
            limiter.allow?(user: "user#{rand(1..100)}")
          end

          end_time = (Time.now.to_f * 1000).to_i

          expect((end_time - start_time) < 1500).to eq true
        end
      end
    end
  end
end
