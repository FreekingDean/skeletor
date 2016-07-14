require 'redcarpet'
require 'bootstrap_material_forms'

module ApplicationHelper
  def print_readme
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    markdown.render(File.read(File.join(Rails.root, 'README.md'))).html_safe
  end

  module BootstrapMaterialForms
    FORM_CONTROL_CLASS = 'form-control'
    def text_field_tag(name, value = nil, options = {})
      add_class(options)
      input = super
      add_label(input, name, options)
    end

    protected
    def add_class(options)
      options[:class] = options[:class].to_s
      options[:class] += " #{FORM_CONTROL_CLASS}" unless options[:class].index(FORM_CONTROL_CLASS)
    end

    def add_label(input, name, options)
      unless options[:no_label]
        return render(partial: 'shared/bootstrap/input_label', locals: {label_text: name.to_s, input: input})
      end
      return "#{input}".html_safe
    end
  end

  include BootstrapMaterialForms
end
