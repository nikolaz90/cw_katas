require_relative 'requester'
initial_url = 'https://www.letsrevolutionizetesting.com/challenge.json'

Requester.new(initial_url: initial_url).start
