# frozen_string_literal: true

module HexletCode
  class FormView
    autoload(:Tag, 'hexlet_code/tag')

    attr_reader :user_data
    attr_accessor :form

    def initialize(user, params)
      @user_data = user
      @form = {
        params: { action: params[:url] || '#', method: 'post' }.merge(params.except(:url)),
        inputs: []
      }
    end

    def input(name, **kwargs)
      value = user_data.public_send(name)
      type = define_type(kwargs)
      options = build_options(type, name, value, kwargs)

      add_input({ type:, options: })
    end

    def submit(value = 'Save')
      add_input({ type: 'input', options: { type: 'submit', value: } })
    end

    def parse
      Tag.build('form', form[:params]) do
        return '' if form[:inputs].empty?

        form[:inputs].map { |input| build_input(input) }.join
      end
    end

    private

    def add_input(input_field)
      form[:inputs] << input_field
    end

    def define_type(options)
      options[:as] == :text ? 'textarea' : 'input'
    end

    def build_options(type, name, value, options)
      fixed_keys = %i[as cols rows]
      clean_options = options.except(*fixed_keys)

      case type
      when 'input'
        { name:, type: 'text', value: }.merge(clean_options)
      else
        cols = options[:cols] || 20
        rows = options[:rows] || 40
        { name:, cols:, rows:, value: }.merge(clean_options)
      end
    end

    def build_input(input)
      label = build_label(input)

      case input[:type]
      when 'input'
        input_field = Tag.build(input[:type], input[:options])
      else
        value = input[:options][:value]
        clean_options = input[:options].except(:value)
        input_field = Tag.build(input[:type], clean_options) { value }
      end

      "#{label}#{input_field}"
    end

    def build_label(input)
      return '' if input[:options][:type] == 'submit'

      name = input[:options][:name]
      Tag.build('label', for: name) { name.capitalize }
    end
  end
end
