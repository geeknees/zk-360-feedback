json.extract! blockchain_record, :id, :evaluation_id, :tx_id, :block_number, :status, :organization_id, :created_at, :updated_at
json.url blockchain_record_url(blockchain_record, format: :json)
