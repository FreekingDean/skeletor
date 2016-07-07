# == Schema Information
#
# Table name: accounts
#
#  id              :integer          not null, primary key
#  name            :string
#  username        :string
#  password_digest :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  api_secret      :string
#

class Account < ApplicationRecord
  has_secure_password
  has_many :skeletons

  def generate_api_key!
    self.api_secret = SecureRandom.base64
    self.save!
  end
end
