module SettingsHelper
  def metadata_fields(form_builder)
    if form_builder.object.is_a? GemVersion
      gem_metadata_fields(form_builder)
    else
      form_builder.text_field(:metadata, '')
    end
  end

  def value_field(form_builder)
    if form_builder.object.is_a? GemVersion
      gem_value_field(form_builder)
    else
      form_builder.text_field(:value, '')
    end
  end

  def gem_metadata_fields(form_builder)
    form_builder.select(:version_qualifier, GemVersion.version_qualifiers)
  end

  def gem_value_field(form_builder)
    form_builder.select(:value, form_builder.object.versions.map {|v| [v['number'], v['number']]})
  end
end
