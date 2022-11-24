# frozen_string_literal: true

module HexletCode
  autoload(:Tag, 'hexlet_code/tag')

  class Label
    def self.render(name)
      Tag.build('label', for: name) { name.capitalize }
    end
  end
end
