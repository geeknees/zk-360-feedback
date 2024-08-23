require "test_helper"

class EvaluationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @evaluation = evaluations(:one)
  end

  test "should get index" do
    get evaluations_url
    assert_response :success
  end

  test "should get new" do
    get new_evaluation_url
    assert_response :success
  end

  test "should create evaluation" do
    assert_difference("Evaluation.count") do
      post evaluations_url, params: { evaluation: { blockchain_tx_id: @evaluation.blockchain_tx_id, category_id: @evaluation.category_id, comments: @evaluation.comments, encrypted_data: @evaluation.encrypted_data, evaluatee_id: @evaluation.evaluatee_id, evaluator_id: @evaluation.evaluator_id, organization_id: @evaluation.organization_id, score: @evaluation.score, zk_proof: @evaluation.zk_proof } }
    end

    assert_redirected_to evaluation_url(Evaluation.last)
  end

  test "should show evaluation" do
    get evaluation_url(@evaluation)
    assert_response :success
  end

  test "should get edit" do
    get edit_evaluation_url(@evaluation)
    assert_response :success
  end

  test "should update evaluation" do
    patch evaluation_url(@evaluation), params: { evaluation: { blockchain_tx_id: @evaluation.blockchain_tx_id, category_id: @evaluation.category_id, comments: @evaluation.comments, encrypted_data: @evaluation.encrypted_data, evaluatee_id: @evaluation.evaluatee_id, evaluator_id: @evaluation.evaluator_id, organization_id: @evaluation.organization_id, score: @evaluation.score, zk_proof: @evaluation.zk_proof } }
    assert_redirected_to evaluation_url(@evaluation)
  end

  test "should destroy evaluation" do
    assert_difference("Evaluation.count", -1) do
      delete evaluation_url(@evaluation)
    end

    assert_redirected_to evaluations_url
  end
end
