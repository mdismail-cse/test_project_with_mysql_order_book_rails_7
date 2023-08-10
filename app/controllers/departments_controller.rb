# app/controllers/departments_controller.rb
class DepartmentsController < ApplicationController

  def index
    # @departments = Department.all
    if params[:search].present?
      @departments = Department.where("title LIKE :search OR description LIKE :search", search: "%#{params[:search]}%")
      @departments = @departments.where(delete_at: nil)
    else
      @departments = Department.where(delete_at: nil)
    end
  end

  def show
    department = Department.find(params[:id])
    if department.delete_at.nil?
    @department = Department.find(params[:id])
    else
      redirect_to departments_url

    end

  end

  def new
    @department = Department.new
  end

  def edit
    @department = Department.find(params[:id])

  end

  def create
    @department = Department.new(department_params)

    if @department.save
      redirect_to @department, notice: 'Department was successfully created.'
    else
      render :new
    end
  end

  def update
    @department = Department.find(params[:id])

    if @department.update(department_params)
      redirect_to @department, notice: 'Department was successfully updated.'
    else
      render :edit
    end
  end

  def destroy

    @department = Department.find(params[:id])
    @department.update_column(:delete_at ,DateTime.now)

    redirect_to departments_url, notice: 'Department was successfully destroyed.'
  end

  private


  def department_params
    params.require(:department).permit(:title, :description, :search)
  end
end
