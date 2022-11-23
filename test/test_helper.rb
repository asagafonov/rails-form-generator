# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'

def load_fixture(filename)
  File.read("#{File.dirname(__FILE__)}/fixtures/#{filename}")
end
