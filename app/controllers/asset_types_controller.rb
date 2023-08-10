class AssetTypesController < ApplicationController
  before_action :set_asset_type, only: %i[ show edit update destroy ]

  # GET /asset_types or /asset_types.json
  def index

    @asset_types = AssetType.where(delete_at: nil)
  end

  # GET /asset_types/1 or /asset_types/1.json
  def show
    asset_type = AssetType.find(params[:id])

    if asset_type.delete_at.nil?
      @asset_type = AssetType.find(params[:id])

    else
      redirect_to asset_type_url
    end
  end

  # GET /asset_types/new
  def new
    @asset_type = AssetType.new
  end

  # GET /asset_types/1/edit
  def edit
  end

  # POST /asset_types or /asset_types.json
  def create
    @asset_type = AssetType.new(asset_type_params)

    respond_to do |format|
      if @asset_type.save
        format.html { redirect_to asset_type_url(@asset_type), notice: "Asset type was successfully created." }
        format.json { render :show, status: :created, location: @asset_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @asset_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asset_types/1 or /asset_types/1.json
  def update
    respond_to do |format|
      if @asset_type.update(asset_type_params)
        format.html { redirect_to asset_type_url(@asset_type), notice: "Asset type was successfully updated." }
        format.json { render :show, status: :ok, location: @asset_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @asset_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asset_types/1 or /asset_types/1.json
  def destroy
    @asset_type = AssetType.find(params[:id])
    @asset_type.update_columns(delete_at: DateTime.now)

    respond_to do |format|
      format.html { redirect_to asset_types_url, notice: "Asset type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset_type
      @asset_type = AssetType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def asset_type_params
      params.require(:asset_type).permit(:product_catagory)
    end
end
