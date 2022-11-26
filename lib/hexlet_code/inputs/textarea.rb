# frozen_string_literal: true

module HexletCode
  class Textarea < BasicInput
    def self.render(input)
      options = defaults.merge(input[:options]).except(:value)

      textarea = Tag.build('textarea', options) do
        input[:options][:value]
      end

      label = render_label(input[:options][:name])
      "#{label}#{textarea}"
    end

    def self.defaults
      { name: '', cols: 20, rows: 40 }
    end
  end
end
