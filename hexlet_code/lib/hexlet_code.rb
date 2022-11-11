# frozen_string_literal: true

require_relative "hexlet_code/version"

# rubocop:disable Style/GlobalVars

$tmp = []

module HexletCode
  class << self
    def form_for(user, url: "#")
      user.extend(Input)

      yield(user) if block_given?

      inputs = $tmp.join
      $tmp.clear
      [
        "<form action=\"#{url}\" method=\"post\">",
        inputs,
        "</form>"
      ].join
    end

    module Input
      def input(field, **kwargs)
        raise unless public_send(field)

        fixed_keys = %i[as cols rows]
        attributes = kwargs.keys.reject { |key| fixed_keys.include?(key) }.map { |key| "#{key}=\"#{kwargs[key]}\"" }
        attributes_as_s = attributes.empty? ? "" : " #{attributes.join(" ")}"

        $tmp << if kwargs[:as] == "text"
                  build_textarea(field, attributes_as_s, kwargs)
                else
                  build_input(field, attributes_as_s)
                end
      end

      def build_input(field, attrs)
        "<input name=\"#{field}\" type=\"text\" value=\"#{public_send(field)}\"#{attrs} />"
      end

      def build_textarea(field, attrs, options)
        cols = options[:cols] || 20
        rows = options[:rows] || 40
        "<textarea name=\"#{field}\" cols=\"#{cols}\" rows=\"#{rows}\"#{attrs}>#{public_send(field)}</textarea>"
      end
    end
  end

  class Error < StandardError; end

  class Tag
    @@single_tags = %w[br hr img input link]

    class << self
      def build(tag, params = {})
        params_string = params.empty? ? "" : " #{params_to_s(params)}"
        text_content = block_given? ? yield : ""

        single_tag_output = "<#{tag}#{params_string} />"
        double_tag_output = "<#{tag}#{params_string}>#{text_content}</#{tag}>"

        single_tag?(tag) ? single_tag_output : double_tag_output
      end

      private

      def single_tag?(tag)
        @@single_tags.include?(tag)
      end

      def params_to_s(params)
        params
          .keys
          .map { |key| "#{key}=\"#{params[key]}\"" }
          .join(" ")
      end
    end
  end
end

# rubocop:enable Style/GlobalVars
