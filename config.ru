require 'sinatra'
require 'rest-client'
require 'json'
require 'dalli'

require './remote_data'
require './application'

run Application