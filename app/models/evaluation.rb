# == Schema Information
#
# Table name: evaluations
#
#  id               :integer          not null, primary key
#  comments         :text
#  encrypted_data   :text
#  score            :integer
#  zk_proof         :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  blockchain_tx_id :string
#  category_id      :integer          not null
#  evaluatee_id     :integer          not null
#  organization_id  :integer          not null
#
# Indexes
#
#  index_evaluations_on_category_id      (category_id)
#  index_evaluations_on_evaluatee_id     (evaluatee_id)
#  index_evaluations_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  category_id      (category_id => categories.id)
#  evaluatee_id     (evaluatee_id => users.id)
#  organization_id  (organization_id => organizations.id)
#
class Evaluation < ApplicationRecord
  belongs_to :evaluatee
  belongs_to :category
  belongs_to :organization

  # 簡単なバリデーション
  validates :score, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
