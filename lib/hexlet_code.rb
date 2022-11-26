# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload(:FormView, 'hexlet_code/form_view')
  autoload(:Renderer, 'hexlet_code/renderer.rb')
  autoload(:Tag, 'hexlet_code/tag')
  autoload(:BasicInput, 'hexlet_code/inputs/basic_input')
  autoload(:Label, 'hexlet_code/inputs/label')
  autoload(:Input, 'hexlet_code/inputs/input')
  autoload(:Textarea, 'hexlet_code/inputs/textarea')
  autoload(:Submit, 'hexlet_code/inputs/submit')

  def self.form_for(data, **kwargs)
    f = FormView.new(data, kwargs)
    yield(f) if block_given?
    Renderer.render(f.form)
  end
end
