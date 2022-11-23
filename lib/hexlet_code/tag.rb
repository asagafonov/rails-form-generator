# frozen_string_literal: true

module HexletCode
  class Tag
    class << self
      def build(tag, params = {})
        attrs = build_attrs(params)
        return "<#{tag}#{attrs}>" if single_tag?(tag)

        text_content = block_given? ? yield : ''
        "<#{tag}#{attrs}>#{text_content}</#{tag}>"
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
