# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'

def prepare_file(path)
  file = File.open(path, 'r:UTF-8')
  result = file.read
  file.close
  result
end
