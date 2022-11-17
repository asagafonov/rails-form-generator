# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload(:FormView, 'hexlet_code/form_view')

  def self.form_for(user, **kwargs)
    f = FormView.new(user, kwargs)
    yield(f) if block_given?
    f.parse
  end
end
