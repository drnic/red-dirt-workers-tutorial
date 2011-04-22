#!/usr/bin/env ruby

require 'rest-client'
require 'json'
require 'dalli'
require 'queue_classic'

require './remote_data'
worker = QC::Worker.new

puts worker.start