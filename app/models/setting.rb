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
  scope :database_setting, -> { find_by(type: 'DatabaseSetting') }

  def setting_name
    self.class.name.split(/(?=[A-Z])/).join(' ')
  end
end
