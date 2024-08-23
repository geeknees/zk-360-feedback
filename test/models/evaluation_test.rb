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
#  evaluator_id     :integer          not null
#  organization_id  :integer          not null
#
# Indexes
#
#  index_evaluations_on_category_id      (category_id)
#  index_evaluations_on_evaluatee_id     (evaluatee_id)
#  index_evaluations_on_evaluator_id     (evaluator_id)
#  index_evaluations_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  category_id      (category_id => categories.id)
#  evaluatee_id     (evaluatee_id => users.id)
#  evaluator_id     (evaluator_id => users.id)
#  organization_id  (organization_id => organizations.id)
#
require "test_helper"

class EvaluationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
