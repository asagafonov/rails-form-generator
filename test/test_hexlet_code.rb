# frozen_string_literal: true

require 'test_helper'
require_relative '../lib/hexlet_code'

class TestHexletCode < Minitest::Test
  def self.prepare
    Struct.new('User', :name, :profession, :gender, keyword_init: true)
  end

  prepare

  def test_that_it_has_a_version_number
    refute_nil HexletCode::VERSION
  end

  def test_it_returns_simple_form
    user = Struct::User.new(name: 'Chuck')
    expected_form = load_fixture('form_simple.html')

    form = HexletCode.form_for(user) do |f|
      f.input(:name, as: :text)
      f.submit
    end

    assert_equal(expected_form, form)
  end

  def test_it_returns_complicated_form
    user = Struct::User.new(name: 'Bobby', profession: 'Software engineer', gender: 'male')
    expected_form = load_fixture('form_complicated.html')

    form = HexletCode.form_for(user, url: '/users') do |f|
      f.input(:name, class: 'user-input')
      f.input(:profession, as: :text, rows: 50, cols: 50)
      f.submit('Send')
    end

    assert_equal(expected_form, form)
  end

  def test_raise_if_has_inexistant_field
    user = Struct::User.new(name: 'Chuck')

    assert_raises NoMethodError do
      HexletCode.form_for(user) do |f|
        f.input(:inexistant_attribute)
      end
    end
  end
end
