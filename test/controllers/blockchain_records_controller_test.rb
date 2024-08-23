require "test_helper"

class BlockchainRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blockchain_record = blockchain_records(:one)
  end

  test "should get index" do
    get blockchain_records_url
    assert_response :success
  end

  test "should get new" do
    get new_blockchain_record_url
    assert_response :success
  end

  test "should create blockchain_record" do
    assert_difference("BlockchainRecord.count") do
      post blockchain_records_url, params: { blockchain_record: { block_number: @blockchain_record.block_number, evaluation_id: @blockchain_record.evaluation_id, organization_id: @blockchain_record.organization_id, status: @blockchain_record.status, tx_id: @blockchain_record.tx_id } }
    end

    assert_redirected_to blockchain_record_url(BlockchainRecord.last)
  end

  test "should show blockchain_record" do
    get blockchain_record_url(@blockchain_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_blockchain_record_url(@blockchain_record)
    assert_response :success
  end

  test "should update blockchain_record" do
    patch blockchain_record_url(@blockchain_record), params: { blockchain_record: { block_number: @blockchain_record.block_number, evaluation_id: @blockchain_record.evaluation_id, organization_id: @blockchain_record.organization_id, status: @blockchain_record.status, tx_id: @blockchain_record.tx_id } }
    assert_redirected_to blockchain_record_url(@blockchain_record)
  end

  test "should destroy blockchain_record" do
    assert_difference("BlockchainRecord.count", -1) do
      delete blockchain_record_url(@blockchain_record)
    end

    assert_redirected_to blockchain_records_url
  end
end
