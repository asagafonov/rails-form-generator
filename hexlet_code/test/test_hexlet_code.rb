# frozen_string_literal: true

require 'test_helper'
require_relative '../lib/hexlet_code'

class TestHexletCode < Minitest::Test
  def setup
    @example_form1 = prepare_file('./test/fixtures/form1.txt')
    @example_form2 = prepare_file('./test/fixtures/form2.txt')

    Struct.new('User', :name, :profession, :gender, keyword_init: true)

    @user1 = Struct::User.new(name: 'Chuck')
    @user2 = Struct::User.new(
      name: 'Bobby',
      profession: 'Software engineer',
      gender: 'male'
    )
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_it_returns_simple_form
    form = HexletCode.form_for(@user1) do |f|
      f.input(:name, as: :text)
      f.submit
    end

    assert_equal(form, @example_form1)
  end

  def test_it_returns_complicated_form
    form = HexletCode.form_for(@user2, url: '/users') do |f|
      f.input(:name, class: 'user-input')
      f.input(:profession, as: :text, rows: 50, cols: 50)
      f.submit('Send')
    end

    assert_equal(form, @example_form2)
  end

  def test_forms_not_equal
    form1 = HexletCode.form_for(@user1) do |f|
      f.input(:name, as: :text)
    end

    form2 = HexletCode.form_for(@user2, url: '/users') do |f|
      f.input(:name, class: 'user-input')
      f.input(:profession, as: :text, rows: 50, cols: 50)
    end

    refute_equal(form1, form2)
  end

  def test_raise_if_has_inexistant_field
    assert_raises NoMethodError do
      HexletCode.form_for(@user1) do |f|
        f.input(:inexistant_attribute)
      end
    end
  end
end
