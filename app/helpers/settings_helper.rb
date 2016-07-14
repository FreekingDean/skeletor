module SettingsHelper
  METADATA_FIELD_BUILDERS = {
    GemVersion => :gem_metadata_fields,
    RailsVersion => :gem_metadata_fields,
    DatabaseSetting => :database_metadata_fields
  }

  VALUE_FIELD_BUILDERS = {
    GemVersion => :gem_value_field,
    RailsVersion => :gem_value_field,
    DatabaseSetting => :database_value_fields
  }

  def metadata_fields(form_builder)
    if METADATA_FIELD_BUILDERS.has_key?(form_builder.object.class)
      self.public_send(METADATA_FIELD_BUILDERS[form_builder.object.class], form_builder)
    else
      form_builder.text_area(:metadata)
    end
  end

  def value_field(form_builder)
    if VALUE_FIELD_BUILDERS.has_key?(form_builder.object.class)
      self.public_send(VALUE_FIELD_BUILDERS[form_builder.object.class], form_builder)
    else
      form_builder.text_field(:value)
    end
  end

  def database_metadata_fields(form_builder)
    return nil
  end

  def database_value_fields(form_builder)
    form_builder.select(
      :value,
      options_for_select(
        DatabaseSetting::COMMON_DATABASES.map{|db_name| [db_name, db_name]},
        DatabaseSetting::DEFAULT_DATABASE,
      ),
      label: 'Database'
    )
  end

  def gem_metadata_fields(form_builder)
    form_builder.select(:version_qualifier, GemVersion.version_qualifiers, label: 'Version Limit')
  end

  def gem_value_field(form_builder)
    form_builder.select(:value, form_builder.object.versions.map {|v| [v['number'], v['number']]}, label: 'Version')
  end
end
