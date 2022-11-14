# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  autoload(:FormView, "#{__dir__}/form_view/form_view")

  class << self
    def form_for(user, url: "#")
      user.extend(Input)
      user.instance_variable_set(:@form_view, FormView.new(url))

      yield(user) if block_given?

      user.instance_variable_get(:@form_view).to_s
    end

    module Input
      def input(name, **kwargs)
        form_view = instance_variable_get(:@form_view)

        type = kwargs[:as] == "text" ? "textarea" : "input"
        options = build_options(type, name, kwargs)

        form_view.add_input({ type:, field: name.to_s, field_value: public_send(name), options: })
        instance_variable_set(:@form_view, form_view)
      end

      def submit(value = "Save")
        form_view = instance_variable_get(:@form_view)
        form_view.add_input({ type: "input", options: { type: "submit", value: } })
        instance_variable_set(:@form_view, form_view)
      end

      private

      def build_options(type, name, options)
        fixed_keys = %i[as cols rows]
        clean_options = options.except(*fixed_keys)

        if type == "input"
          { name:, type: "text", value: public_send(name) }.merge(clean_options)
        else
          cols = options[:cols] || 20
          rows = options[:rows] || 40
          { name:, cols:, rows: }.merge(clean_options)
        end
      end
    end
  end

  class Error < StandardError; end
end
