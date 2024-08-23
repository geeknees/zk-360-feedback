require "application_system_test_case"

class BlockchainRecordsTest < ApplicationSystemTestCase
  setup do
    @blockchain_record = blockchain_records(:one)
  end

  test "visiting the index" do
    visit blockchain_records_url
    assert_selector "h1", text: "Blockchain records"
  end

  test "should create blockchain record" do
    visit blockchain_records_url
    click_on "New blockchain record"

    fill_in "Block number", with: @blockchain_record.block_number
    fill_in "Evaluation", with: @blockchain_record.evaluation_id
    fill_in "Organization", with: @blockchain_record.organization_id
    fill_in "Status", with: @blockchain_record.status
    fill_in "Tx", with: @blockchain_record.tx_id
    click_on "Create Blockchain record"

    assert_text "Blockchain record was successfully created"
    click_on "Back"
  end

  test "should update Blockchain record" do
    visit blockchain_record_url(@blockchain_record)
    click_on "Edit this blockchain record", match: :first

    fill_in "Block number", with: @blockchain_record.block_number
    fill_in "Evaluation", with: @blockchain_record.evaluation_id
    fill_in "Organization", with: @blockchain_record.organization_id
    fill_in "Status", with: @blockchain_record.status
    fill_in "Tx", with: @blockchain_record.tx_id
    click_on "Update Blockchain record"

    assert_text "Blockchain record was successfully updated"
    click_on "Back"
  end

  test "should destroy Blockchain record" do
    visit blockchain_record_url(@blockchain_record)
    click_on "Destroy this blockchain record", match: :first

    assert_text "Blockchain record was successfully destroyed"
  end
end
