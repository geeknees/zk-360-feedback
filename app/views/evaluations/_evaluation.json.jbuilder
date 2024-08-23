json.extract! evaluation, :id, :evaluatee_id, :category_id, :score, :comments, :encrypted_data, :zk_proof, :blockchain_tx_id, :organization_id, :created_at, :updated_at
json.url evaluation_url(evaluation, format: :json)
