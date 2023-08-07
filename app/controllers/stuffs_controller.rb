class StuffsController < ApplicationController
  require "csv"
  before_action :set_stuff, only: %i[ show edit update destroy ]

  # GET /stuffs or /stuffs.json
  def import
    if params[:file].nil?
      redirect_to stuffs_url, notice: "Please select a CSV file"
    else
      if params[:file].content_type == "text/csv"
        csv_data = params[:file].read
        parsed_data = CSV.parse(csv_data, headers: true, col_sep: ",", header_converters: :symbol)
        
        parsed_data.each do |row|

          stuff_hash = {}
          stuff_hash[:email] = row[:email]
          stuff_hash[:password] = row[:password]
          stuff_hash[:role_id] = row[:role]

          #debugger

          s = Stuff.new
          s.email = stuff_hash[:email]
          s.password = stuff_hash[:password]
          s.role_id = stuff_hash[:role_id]
          

          s.save

        end
        





        redirect_to stuffs_url, notice: "Users Imported"
      else
        redirect_to stuffs_url, notice: "Only CSV files are allowed"
      end
    end
  end

  def index
    @q = Stuff.ransack(params[:q])
    @stuffs = @q.result(distinct: true).page(params[:page]).per(10)

    if stuff_signed_in?
    @profile = current_stuff
    end
  end

  # GET /stuffs/1 or /stuffs/1.json
  def show
    @profile = current_stuff
  end

  # GET /stuffs/new
  def new
    @stuff = Stuff.new
  end

  # GET /stuffs/1/edit
  def edit
    
  end

  # POST /stuffs or /stuffs.json
  def create
    @stuff = Stuff.new(stuff_params)

    respond_to do |format|
      if @stuff.save
        format.html { redirect_to stuff_url(@stuff), notice: "Stuff was successfully created." }
        format.json { render :show, status: :created, location: @stuff }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stuff.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /stuffs/1 or /stuffs/1.json
  def update
    if params[:stuff][:current_password].present?
    respond_to do |format|
      if @stuff.valid_password?(params[:stuff][:current_password])
        if @stuff.update_with_password(stuff_params)
          bypass_sign_in(@stuff) # If you want to sign in the user after updating the password
          format.html { redirect_to stuff_url(@stuff), notice: "Stuff was successfully updated." }
          format.json { render :show, status: :ok, location: @stuff }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @stuff.errors, status: :unprocessable_entity }
        end
      else
        @stuff.errors.add(:current_password, "does not match the current password")
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stuff.errors, status: :unprocessable_entity }
      end
    end

    else
      @stuff.update(stuff_params)
      redirect_to stuffs_url
    end
  end

  # DELETE /stuffs/1 or /stuffs/1.json
  def destroy
    @stuff.destroy

    respond_to do |format|
      format.html { redirect_to stuffs_url, notice: "Stuff was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_stuff
    @stuff = Stuff.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def stuff_params
    params.require(:stuff).permit(:email, :password, :role_id,:current_password, :profile_image, :name, :address, :blood_group, :position, :department, :position_id, :phone_number, :format)
  end
end




