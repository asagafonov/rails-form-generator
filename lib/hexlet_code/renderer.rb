# frozen_string_literal: true

module HexletCode
  class Renderer
    class << self
      def render(form)
        Tag.build('form', form[:params]) do
          return '' if form[:inputs].empty?

          form[:inputs].map { |input| render_input(input) }.join
        end
      end

      def render_input(input)
        renderer_class = HexletCode.const_get(input[:type])

        renderer_class.render(input)
      end
    end
  end
end
