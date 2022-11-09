# frozen_string_literal: true

require "test_helper"
autoload(:HexletCode, "../lib/hexlet_code")

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_it_generates_empty_single_tag
    result = HexletCode::Tag.build("img")
    assert_equal(result, "<img />")
  end

  def test_it_generates_single_tag_with_params
    result = HexletCode::Tag.build("img", src: "path/to/image", alt: "placeholder")
    assert_equal(result, "<img src=\"path/to/image\" alt=\"placeholder\" />")
  end

  def test_it_generates_empty_double_tag
    result = HexletCode::Tag.build("div")
    assert_equal(result, "<div></div>")
  end

  def test_it_generates_double_tag_with_params
    result = HexletCode::Tag.build("div", prop1: "prop1", prop2: "prop2")
    assert_equal(result, "<div prop1=\"prop1\" prop2=\"prop2\"></div>")
  end

  def test_it_generates_double_tag_with_params_and_text
    result = HexletCode::Tag.build("div", prop1: "prop1", prop2: "prop2") { "Text content" }
    assert_equal(result, "<div prop1=\"prop1\" prop2=\"prop2\">Text content</div>")
  end
end
