class Evaluation < ApplicationRecord
  belongs_to :evaluator
  belongs_to :evaluatee
  belongs_to :category
  belongs_to :organization
end
