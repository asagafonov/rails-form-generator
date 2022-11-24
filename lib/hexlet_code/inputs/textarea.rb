# frozen_string_literal: true

module HexletCode
  autoload(:Tag, 'hexlet_code/tag')
  autoload(:Label, 'hexlet_code/inputs/label')

  class Textarea
    def self.render(input)
      options = defaults.merge(input[:options]).except(:value)

      textarea = Tag.build('textarea', options) do
        input[:options][:value]
      end

      label = Label.render(input[:options][:name])
      "#{label}#{textarea}"
    end

    def self.defaults
      { name: '', cols: 20, rows: 40 }
    end
  end
end
