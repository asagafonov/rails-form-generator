# frozen_string_literal: true

module HexletCode
  class FormView
    attr_reader :form

    def initialize(data, params)
      @data = data
      @form = {
        params: { action: params[:url] || '#', method: 'post' }.merge(params.except(:url)),
        inputs: []
      }
    end

    def input(name, **kwargs)
      value = @data.public_send(name)
      options = kwargs.except(:as).merge({ name:, value: })
      type = kwargs[:as] == :text ? 'Textarea' : 'Input'

      add_input({ type:, options: })
    end

    def submit(value = 'Save')
      add_input({ type: 'Submit', options: { value: } })
    end

    private

    def add_input(input_field)
      form[:inputs] << input_field
    end
  end
end
