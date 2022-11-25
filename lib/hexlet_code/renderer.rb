# frozen_string_literal: true

module HexletCode
  autoload(:Tag, 'hexlet_code/tag')
  autoload(:Input, 'hexlet_code/inputs/input')
  autoload(:Textarea, 'hexlet_code/inputs/textarea')
  autoload(:Submit, 'hexlet_code/inputs/submit')

  class Renderer
    class << self
      def render(form)
        Tag.build('form', form[:params]) do
          return '' if form[:inputs].empty?

          form[:inputs].map { |input| render_input(input) }.join
        end
      end

      def render_input(input)
        case input[:type]
        when :default
          Input.render(input)
        when :text
          Textarea.render(input)
        when :submit
          Submit.render(input)
        else
          ''
        end
      end
    end
  end
end
