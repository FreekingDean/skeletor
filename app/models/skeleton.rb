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

class Skeleton < ApplicationRecord
  belongs_to :account
  has_many :settings, as: :settingable, dependent: :destroy, inverse_of: :settingable
  accepts_nested_attributes_for :settings

  def default_settings
    RailsVersion.new(name: 'Rails Version', value: 'latest')
  end
end
