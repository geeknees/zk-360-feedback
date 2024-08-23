class BlockchainRecord < ApplicationRecord
  belongs_to :evaluation
  belongs_to :organization
end
