# frozen_string_literal: true

module HexletCode
  class Tag
    class << self
      def build(tag, params = {})
        text_content = block_given? ? yield : ''
        attrs = build_attrs(params)

        if single_tag?(tag)
          "<#{tag}#{attrs}>"
        else
          "<#{tag}#{attrs}>#{text_content}</#{tag}>"
        end
      end

      private

      def build_attrs(params)
        return '' if params.empty?

        attrs = params.map { |key, val| "#{key}=\"#{val}\"" }.join(' ')
        " #{attrs}"
      end

      def single_tag?(tag)
        single_tags = %w[br hr img input link]
        single_tags.include?(tag)
      end
    end
  end
end
