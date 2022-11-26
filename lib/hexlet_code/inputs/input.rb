# frozen_string_literal: true

module HexletCode
  class Input < BasicInput
    def self.render(input)
      options = defaults.merge(input[:options])

      input_field = Tag.build('input', options)

      label = render_label(input[:options][:name])
      "#{label}#{input_field}"
    end

    def self.defaults
      { name: '', type: 'text', value: '' }
    end
  end
end
