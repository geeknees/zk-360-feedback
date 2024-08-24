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

    if verify_zk_proof
      @evaluation = @category.evaluations.new(evaluation_params)
      @evaluation.organization = @organization

      if @evaluation.save
        generate_input_json
        generate_witness
        # 単純比較実装なのでproofは更新しない
        # generate_proof

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
  def verify_zk_proof
    proof_file = Rails.root.join("implement_zk/proof.json")
    public_file = Rails.root.join("implement_zk/public.json")
    verification_key = Rails.root.join("implement_zk/verification_key.json")

    result = `snarkjs groth16 verify #{verification_key} #{public_file} #{proof_file}`
    result.include?("OK")
  end

  # input.jsonを生成するメソッド
  def generate_input_json
    input_data = {
      "user_hash" => current_user.hashed_id.to_i,
      "expected_hash" => current_user.hashed_id.to_i + 1
    }
    File.open(Rails.root.join("implement_zk", "input.json"), "w") do |f|
      f.write(input_data.to_json)
    end
  end

  # witnessを生成するメソッド
  def generate_witness
    generate_witness = Rails.root.join("implement_zk/simple_proof_js/generate_witness.js")
    wasm_file = Rails.root.join("implement_zk/simple_proof_js/simple_proof.wasm")
    input_file = Rails.root.join("implement_zk/input.json")
    witness_file = Rails.root.join("implement_zk/witness.wtns")

    system("node #{generate_witness} #{wasm_file} #{input_file} #{witness_file}")
  end

  # 証明を生成するメソッド
  def generate_proof
    simple_proof_key = Rails.root.join("implement_zk/simple_proof_0001.zkey")
    witness_file = Rails.root.join("implement_zk/witness.wtns")
    proof_file = Rails.root.join("implement_zk/proof.json")
    public_file = Rails.root.join("implement_zk/public.json")

    system("snarkjs groth16 prove #{simple_proof_key} #{witness_file} #{proof_file} #{public_file}")
  end
end
