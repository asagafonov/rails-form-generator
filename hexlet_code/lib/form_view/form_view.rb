# frozen_string_literal: true

require "nokogiri"
autoload(:Tag, "./lib/tag/tag")

class FormView
  attr_accessor :form

  def initialize(url = "#", method = "post")
    @form = {
      action: url,
      method:,
      inputs: []
    }
  end

  def add_input(input_field)
    form[:inputs] << input_field
  end

  def to_s
    Tag.build("form", action: form[:action], method: form[:method]) do
      return "" if form[:inputs].empty?

      form[:inputs].map { |input| build_input(input) }.join
    end
  end

  def to_html
    Nokogiri::HTML.parse(form.to_s)
  end

  private

  def build_input(input)
    label = ""
    label = Tag.build("label", for: input[:field]) { input[:field].capitalize } if input[:options][:type] != "submit"

    input_field = Tag.build(input[:type], input[:options]) do
      input[:type] == "textarea" ? input[:field_value] : ""
    end

    "#{label}#{input_field}"
  end
end
