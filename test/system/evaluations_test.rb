require "application_system_test_case"

class EvaluationsTest < ApplicationSystemTestCase
  setup do
    @evaluation = evaluations(:one)
  end

  test "visiting the index" do
    visit evaluations_url
    assert_selector "h1", text: "Evaluations"
  end

  test "should create evaluation" do
    visit evaluations_url
    click_on "New evaluation"

    fill_in "Blockchain tx", with: @evaluation.blockchain_tx_id
    fill_in "Category", with: @evaluation.category_id
    fill_in "Comments", with: @evaluation.comments
    fill_in "Encrypted data", with: @evaluation.encrypted_data
    fill_in "Evaluatee", with: @evaluation.evaluatee_id
    fill_in "Evaluator", with: @evaluation.evaluator_id
    fill_in "Organization", with: @evaluation.organization_id
    fill_in "Score", with: @evaluation.score
    fill_in "Zk proof", with: @evaluation.zk_proof
    click_on "Create Evaluation"

    assert_text "Evaluation was successfully created"
    click_on "Back"
  end

  test "should update Evaluation" do
    visit evaluation_url(@evaluation)
    click_on "Edit this evaluation", match: :first

    fill_in "Blockchain tx", with: @evaluation.blockchain_tx_id
    fill_in "Category", with: @evaluation.category_id
    fill_in "Comments", with: @evaluation.comments
    fill_in "Encrypted data", with: @evaluation.encrypted_data
    fill_in "Evaluatee", with: @evaluation.evaluatee_id
    fill_in "Evaluator", with: @evaluation.evaluator_id
    fill_in "Organization", with: @evaluation.organization_id
    fill_in "Score", with: @evaluation.score
    fill_in "Zk proof", with: @evaluation.zk_proof
    click_on "Update Evaluation"

    assert_text "Evaluation was successfully updated"
    click_on "Back"
  end

  test "should destroy Evaluation" do
    visit evaluation_url(@evaluation)
    click_on "Destroy this evaluation", match: :first

    assert_text "Evaluation was successfully destroyed"
  end
end
