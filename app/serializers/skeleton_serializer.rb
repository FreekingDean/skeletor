class SkeletonSerializer < ActiveModel::Serializer
  attributes :name, :slug, :gems, :rails_version
  has_many :settings

  def gems
    object.settings.gem_versions.map do |gem|
      [gem.gem_name, {version: gem.bundler_version}]
    end.to_h
  end

  def rails_version
    object.settings.rails_version.bundler_version
  end
end
