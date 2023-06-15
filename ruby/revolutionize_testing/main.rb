# frozen_string_literal: true

require 'net/http'
require 'json'
require_relative 'requester'
initial_url = 'https://www.letsrevolutionizetesting.com/challenge.json'

Requester.new(initial_url:).start
