# == Schema Information
#
# Table name: skeletons
#
#  id         :integer          not null, primary key
#  name       :string
#  slug       :string
#  account_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SkeletonSerializer < ActiveModel::Serializer
  attributes :name, :slug, :gems, :database
  has_many :settings

  def gems
    object.settings.gem_versions.map do |gem|
      [gem.gem_name, {version: gem.bundler_version}]
    end.to_h
  end

  def database
    object.settings.database_setting.try(:value)
  end
end
