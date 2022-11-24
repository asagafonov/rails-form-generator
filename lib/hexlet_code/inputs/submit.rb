# frozen_string_literal: true

module HexletCode
  autoload(:Tag, 'hexlet_code/tag')

  class Submit
    def self.render(input)
      options = defaults.merge(input[:options])

      Tag.build('input', options)
    end

    def self.defaults
      { type: 'submit' }
    end
  end
end
