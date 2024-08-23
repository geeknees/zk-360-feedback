# app/controllers/evaluations_controller.rb
class EvaluationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_organization
  before_action :set_category, only: [ :new, :create ]

  def new
    @evaluation = @category.evaluations.new
    @users = @organization.users.where.not(id: current_user.id)
  end

  def create
    @users = @organization.users.where.not(id: current_user.id)
    # 擬似的なZK証明のチェック
    if verify_zk_proof(params[:zk_proof])
      @evaluation = @category.evaluations.new(evaluation_params)
      @evaluation.organization = @organization

      if @evaluation.save
        redirect_to users_path(@organization.name), notice: "Evaluation was successfully created."
      else
        render :new
      end
    else
      flash[:alert] = "Invalid proof. Evaluation not saved."
      render :new
    end
  end

  private

  def set_organization
    @organization = Organization.find_by!(name: params[:organization_name])
  end

  def set_category
    @category = @organization.categories.find(params[:category_id])
  end

  def evaluation_params
    params.permit(:score, :comments, :evaluatee_id)
  end

  # ZK証明の検証（擬似コード）
  def verify_zk_proof(proof)
    # 本来はzk-SNARKsなどで検証します。ここでは簡単な検証の擬似コード。
    proof == "valid_proof"
  end
end
