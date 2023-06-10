require 'net/http'
require 'json'
require 'pry-byebug'

class Requester
  def initialize(paras = {})
    @initial_url = paras[:initial_url]
  end

  def start(url = @initial_url)
    data = get_json_and_parse(url)
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
