class BlockchainRecordsController < ApplicationController
  before_action :set_blockchain_record, only: %i[ show edit update destroy ]

  # GET /blockchain_records or /blockchain_records.json
  def index
    @blockchain_records = BlockchainRecord.all
  end

  # GET /blockchain_records/1 or /blockchain_records/1.json
  def show
  end

  # GET /blockchain_records/new
  def new
    @blockchain_record = BlockchainRecord.new
  end

  # GET /blockchain_records/1/edit
  def edit
  end

  # POST /blockchain_records or /blockchain_records.json
  def create
    @blockchain_record = BlockchainRecord.new(blockchain_record_params)

    respond_to do |format|
      if @blockchain_record.save
        format.html { redirect_to blockchain_record_url(@blockchain_record), notice: "Blockchain record was successfully created." }
        format.json { render :show, status: :created, location: @blockchain_record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blockchain_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blockchain_records/1 or /blockchain_records/1.json
  def update
    respond_to do |format|
      if @blockchain_record.update(blockchain_record_params)
        format.html { redirect_to blockchain_record_url(@blockchain_record), notice: "Blockchain record was successfully updated." }
        format.json { render :show, status: :ok, location: @blockchain_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blockchain_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blockchain_records/1 or /blockchain_records/1.json
  def destroy
    @blockchain_record.destroy!

    respond_to do |format|
      format.html { redirect_to blockchain_records_url, notice: "Blockchain record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blockchain_record
      @blockchain_record = BlockchainRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blockchain_record_params
      params.require(:blockchain_record).permit(:evaluation_id, :tx_id, :block_number, :status, :organization_id)
    end
end
