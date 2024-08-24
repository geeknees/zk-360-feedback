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

  # ZK証明の検証
  def verify_zk_proof(proof)
    proof_file = Rails.root.join("implement_zk/proof.json")
    public_file = Rails.root.join("implement_zk/public.json")
    verification_key = Rails.root.join("implement_zk/verification_key.json")

    result = `snarkjs groth16 verify #{verification_key} #{public_file} #{proof_file}`
    result.include?("OK")
  end
end
