class AssetStuffsController < ApplicationController
  before_action :set_asset_stuff, only: %i[ show edit update destroy ]

  # GET /asset_stuffs or /asset_stuffs.json
  def index
    @asset_stuffs = AssetStuff.all
  end

  # GET /asset_stuffs/1 or /asset_stuffs/1.json
  def show

  end

  # GET /asset_stuffs/new
  def new

    @asset_stuff = AssetStuff.new
    @stuff = Stuff.find(params[:format])
  end

  # GET /asset_stuffs/1/edit
  def edit
  end

  # POST /asset_stuffs or /asset_stuffs.json
  def create
    # debugger

    @asset_stuff = AssetStuff.new(asset_stuff_params)
    check_id = asset_stuff_params[:company_asset_id]
    if CompanyAsset.exists?(id: check_id)
      respond_to do |format|
        if @asset_stuff.save
          format.html { redirect_to stuffs_url, notice: "Asset stuff was successfully created." }
          # format.json { render :show, status: :created, location: @asset_stuff }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @asset_stuff.errors, status: :unprocessable_entity }
        end
      end
    else
      @asset_stuff.errors.add(:company_asset_id, "Company Asset with ID #{check_id} does not exist.")
      respond_to do |format|
          format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @asset_stuff.errors, status: :unprocessable_entity }
        @stuff= Stuff.find(asset_stuff_params[:stuff_id])
        end
    end



  end

  # PATCH/PUT /asset_stuffs/1 or /asset_stuffs/1.json
  def update

    @asset_stuff = AssetStuff.find(params[:id])
    @stuff = Stuff.find(@asset_stuff.stuff_id)
    if @asset_stuff.return_at.present?
      redirect_to stuff_path(@stuff), notice: 'Already returnd the Asset'
    else

    # Update the attributes and save
      if @asset_stuff.update(status: 'unassigned', return_at: Time.now)
        # Successfully updated
        redirect_to stuff_path(@stuff), notice: 'Record updated successfully.'
      else
        # Update failed
        render :edit
      end
    end
  end

  # DELETE /asset_stuffs/1 or /asset_stuffs/1.json
  def destroy
    debugger
    @asset_stuff.destroy

    respond_to do |format|
      format.html { redirect_to asset_stuffs_url, notice: "Asset stuff was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_asset_stuff
    @asset_stuff = AssetStuff.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def asset_stuff_params
    params.require(:asset_stuff).permit!
  end
end
