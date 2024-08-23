# == Schema Information
#
# Table name: categories
#
#  id              :integer          not null, primary key
#  description     :text
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :integer          not null
#
# Indexes
#
#  index_categories_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  organization_id  (organization_id => organizations.id)
#
class Category < ApplicationRecord
  belongs_to :organization
  has_many :evaluations
end
