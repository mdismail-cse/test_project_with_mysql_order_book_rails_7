class CompanyAssetsController < ApplicationController
  before_action :set_company_asset, only: %i[ show edit update destroy ]

  # GET /company_assets or /company_assets.json
  def index
    @company_assets = CompanyAsset.all
  end

  # GET /company_assets/1 or /company_assets/1.json
  def show
  end

  # GET /company_assets/new
  def new
    @company_asset = CompanyAsset.new
  end

  # GET /company_assets/1/edit
  def edit
  end

  # POST /company_assets or /company_assets.json
  def create
    @company_asset = CompanyAsset.new(company_asset_params)

    respond_to do |format|
      if @company_asset.save
        format.html { redirect_to company_asset_url(@company_asset), notice: "Company asset was successfully created." }
        format.json { render :show, status: :created, location: @company_asset }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_assets/1 or /company_assets/1.json
  def update
    respond_to do |format|
      if @company_asset.update(company_asset_params)
        format.html { redirect_to company_asset_url(@company_asset), notice: "Company asset was successfully updated." }
        format.json { render :show, status: :ok, location: @company_asset }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_assets/1 or /company_assets/1.json
  def destroy
    @company_asset.destroy

    respond_to do |format|
      format.html { redirect_to company_assets_url, notice: "Company asset was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_asset
      @company_asset = CompanyAsset.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_asset_params
      params.require(:company_asset).permit(:name, :product_address, :details, :asset_type_id)
    end
end
