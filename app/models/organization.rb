# == Schema Information
#
# Table name: organizations
#
#  id         :integer          not null, primary key
#  domain     :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Organization < ApplicationRecord
  has_many :users
  has_many :categories
end
