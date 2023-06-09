require 'net/http'
require 'json'
require 'pry-byebug'

class Requester
  def initialize(paras = {})
    @initial_url = paras[:initial_url]
  end

  def start(url = @initial_url)
    data = get_json(url)
    while followable?(data)
      id = get_id(data)
      data = get_json("#{@initial_url}?id=#{id}")
      speak(data)
    end
    data = get_json("#{@initial_url}?id=#{id}")
    speak(data)
  end

  private

  def get_json(url)
    Net::HTTP.get(URI(url))
  end

  def followable?(data)
    JSON.parse(data).key?("follow")
  end

  def get_id(data)
    JSON.parse(data)['follow'].split('id=')[1]
  end

  def speak(data)
    p JSON.parse(data)['message']
  end
end
