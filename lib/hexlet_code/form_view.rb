# frozen_string_literal: true

module HexletCode
  class FormView
    autoload(:Renderer, 'hexlet_code/renderer')

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
      options = kwargs.except(:as).merge({ name:, value: })

      add_input({ type: kwargs[:as] || :default, options: })
    end

    def submit(value = 'Save')
      add_input({ type: :submit, options: { value: } })
    end

    def compose
      Renderer.render(form)
    end

    private

    def add_input(input_field)
      form[:inputs] << input_field
    end
  end
end
