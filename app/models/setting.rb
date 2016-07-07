# == Schema Information
#
# Table name: settings
#
#  id               :integer          not null, primary key
#  settingable_id   :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  name             :string
#  value            :string
#  type             :string
#  metadata         :jsonb            not null
#  settingable_type :string
#

class Setting < ApplicationRecord
  #serialize :metadata, HashWithIndifferentAccessSerializer
  #serialize :preferences, Hash
  belongs_to :settingable, polymorphic: true
  scope :gem_versions, -> {
    gem_classes = ([GemVersion]+GemVersion.descendants)
    query = gem_classes.map do |g|
      "type = ?"
    end.join(' OR ')
    where(query, *gem_classes)
  }
  scope :rails_version, -> { find_by(type: 'RailsVersion') }

  def initialize(attributes={})
    ap attributes
    super(attributes)
  end
end

class GemVersion < Setting
  store_accessor :metadata, :version_qualifier
  LATEST_VERSION = {'number' => 'latest'}
  DEFAULT_VERSION_SCOPE = :minors

  class << self
    def versions(gem_name:, version_scope: DEFAULT_VERSION_SCOPE)
      versions = [LATEST_VERSION]
      versions += Gems.versions(gem_name)
      return get_prereleases(versions) if version_scope == :prereleases
      return get_patches(versions) if version_scope == :patches
      return get_minors(versions) if version_scope == :minors
      return get_majors(versions) if version_scope == :majors
      return [LATEST_VERSION]
    end

    def get_prereleases(versions)
      versions
    end

    def get_patches(versions)
      versions.select { |v| !v['prerelease'] }
    end

    def get_minors(versions)
      versions = get_patches(versions)
      temp_versions = []
      versions.select { |v| select_minors(v, temp_versions) }
    end

    def get_majors(versions)
      versions = get_patches(versions)
      temp_versions = []
      versions.select { |v| select_majors(v, temp_versions) }
    end

    def select_minors(version, temp_versions)
      cur_version = version['number'].split('.')[0..1].join('.')
      return false if temp_versions.include? cur_version
      temp_versions << cur_version
      true
    end

    def select_majors(version, temp_versions)
      cur_version = version['number'].split('.')[0]
      return false if temp_versions.include? cur_version
      temp_versions << cur_version
      true
    end

    def version_qualifiers
      [
        ['Exactly', ''],
        ['At least', '>='],
        ['At least but no more than naxt major', '~>']
      ]
    end
  end

  def versions(version_scope: DEFAULT_VERSION_SCOPE)
    self.class.versions(gem_name: self.gem_name, version_scope: version_scope)
  end

  def gem_name
    metadata['gem_name'] || ''
  end

  def bundler_version
    "#{self.metadata[:version_qualifier]}#{self.value}"
  end
end

class RailsVersion < GemVersion
  def self.gem_name
    'rails'
  end

  def gem_name
    self.class.gem_name
  end
end
