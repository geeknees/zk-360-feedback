class RemoveEvaluatorFromEvaluations < ActiveRecord::Migration[7.2]
  def change
    remove_reference :evaluations, :evaluator
  end
end
