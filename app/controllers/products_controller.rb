class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    products = Product.all
    products = products.where(title: params[:title]) if params[:title].present?
    @products = products.page(params[:page]).per(10)
    @products = @products.where(delete_at: nil)

    @profile = current_stuff
  end

  # GET /products/1 or /products/1.json
  def show

    product = Product.find(params[:id])
    if product.delete_at.nil?
      @product = Product.find(params[:id])
    else
      redirect_to product_url
    end
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.update_columns(delete_at: DateTime.now)

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      product = Product.find(params[:id])
      if product.delete_at.nil?
      @product = Product.find(params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:title, :description)
    end
end
