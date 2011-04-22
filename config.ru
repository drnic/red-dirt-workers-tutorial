require 'sinatra'
require 'rest-client'
require 'json'
require 'dalli'
require 'queue_classic'

require './remote_data'
require './application'

run Application