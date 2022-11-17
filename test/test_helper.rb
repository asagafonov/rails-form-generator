# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'nokogiri'
require 'minitest/autorun'

def load_fixture(filename)
  File.open("#{File.dirname(__FILE__)}/fixtures/#{filename}")
end

def parse_html(file)
  Nokogiri::HTML5(file).at('html/body/form').to_s
end
