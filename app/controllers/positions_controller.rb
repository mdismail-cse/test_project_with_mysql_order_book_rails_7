class PositionsController < ApplicationController

  def index
    # @positions = Position.all
    if params[:search].present?
      @positions = Position.where("post_name LIKE :search OR  description LIKE :search", search: "%#{params[:search]}%")
    else
      @positions = Position.all
    end

  end

  def show
    @position = Position.find(params[:id])

  end

  def new
    @position = Position.new
  end

  def create
    @position = Position.new(position_params)
    debugger
    if @position.save
      redirect_to @position, notice: 'Position was successfully created.'
    else
      render :new
    end
  end

  def edit
    @position = Position.find(params[:id])

  end

  def update
    @position = Position.find(params[:id])

    if @position.update(position_params)
      redirect_to @position, notice: 'Position was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @position = Position.find(params[:id])

    @position.destroy
    redirect_to positions_url, notice: 'Position was successfully destroyed.'
  end

  private

  def position_params
    params.require(:position).permit(:post_name, :department_id, :description, :search)
  end
end
