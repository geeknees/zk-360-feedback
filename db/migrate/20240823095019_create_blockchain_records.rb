class CreateBlockchainRecords < ActiveRecord::Migration[7.2]
  def change
    create_table :blockchain_records do |t|
      t.references :evaluation, null: false, foreign_key: true
      t.string :tx_id
      t.integer :block_number
      t.string :status
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
