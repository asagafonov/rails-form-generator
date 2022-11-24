# frozen_string_literal: true

module HexletCode
  autoload(:Tag, 'hexlet_code/tag')
  autoload(:Label, 'hexlet_code/inputs/label')

  class Input
    def self.render(input)
      options = defaults.merge(input[:options])

      input_field = Tag.build('input', options)

      label = Label.render(input[:options][:name])
      "#{label}#{input_field}"
    end

    def self.defaults
      { name: '', type: 'text', value: '' }
    end
  end
end
