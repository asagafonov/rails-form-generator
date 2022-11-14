# frozen_string_literal: true

class Tag
  @@single_tags = %w[br hr img input link]

  class << self
    def build(tag, params = {})
      params_string = params.empty? ? '' : " #{params_to_s(params)}"
      text_content = block_given? ? yield : ''

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
        .join(' ')
    end
  end
end
