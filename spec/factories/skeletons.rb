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

FactoryGirl.define do
  factory :skeleton do
    name "MyString"
    slug "MyString"
    account_id 1
  end
end
