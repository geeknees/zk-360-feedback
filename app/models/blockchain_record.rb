# == Schema Information
#
# Table name: blockchain_records
#
#  id              :integer          not null, primary key
#  block_number    :integer
#  status          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  evaluation_id   :integer          not null
#  organization_id :integer          not null
#  tx_id           :string
#
# Indexes
#
#  index_blockchain_records_on_evaluation_id    (evaluation_id)
#  index_blockchain_records_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  evaluation_id    (evaluation_id => evaluations.id)
#  organization_id  (organization_id => organizations.id)
#
class BlockchainRecord < ApplicationRecord
  belongs_to :evaluation
  belongs_to :organization
end
