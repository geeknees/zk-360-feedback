class CreateEvaluations < ActiveRecord::Migration[7.2]
  def change
    create_table :evaluations do |t|
      t.references :evaluator, null: false, foreign_key: { to_table: :users }
      t.references :evaluatee, null: false, foreign_key: { to_table: :users }
      t.references :category, null: false, foreign_key: true
      t.integer :score
      t.text :comments
      t.text :encrypted_data
      t.text :zk_proof
      t.string :blockchain_tx_id
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
