# frozen_string_literal: true

# Requester class will get, if there is something to folow
class Requester
  def initialize(initial_url:)
    @initial_url = initial_url
  end

  def start
    data = get_json_and_parse(@initial_url)
    while followable?(data)
      id = get_id(data)
      data = get_json_and_parse("#{@initial_url}?id=#{id}")
      speak(data)
    end
  end

  private

  def get_json_and_parse(url)
    JSON.parse(Net::HTTP.get(URI(url)))
  end

  def followable?(data)
    data.key?("follow")
  end

  def get_id(data)
    data['follow'].split('id=')[1]
  end

  def speak(data)
    p data['message']
  end
end
