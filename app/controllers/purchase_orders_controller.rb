class PurchaseOrdersController < ApplicationController
  before_action :set_purchase_order, only: %i[ show edit update destroy ]

  # GET /purchase_orders or /purchase_orders.json
  def index
    # @purchase_orders = PurchaseOrder.all

    @profile = current_stuff

    purchase_orders = PurchaseOrder.all

    # debugger

    if params[:products_name].present?
      product_ids = Product.where('title LIKE ?', "%#{params[:products_name]}%").pluck(:id)
      purchase_orders = purchase_orders.where(id: LineItem.where(product_id: product_ids).pluck(:purchase_order_id))
    end

    if params[:stuff_email].present?
      stuff_ids = Stuff.where('email LIKE ?', "%#{params[:stuff_email]}%").pluck(:id)
      purchase_orders = purchase_orders.where(stuff_id: stuff_ids)
    end

    purchase_orders = purchase_orders.where(total_price: params[:total_price]) if params[:total_price].present?

    @purchase_orders = purchase_orders.page(params[:page]).per(10)
  end

  # GET /purchase_orders/1 or /purchase_orders/1.json
  def show
  end

  # GET /purchase_orders/new
  def new
    @purchase_order = PurchaseOrder.new
  end

  # GET /purchase_orders/1/edit
  def edit
  end

  # POST /purchase_orders or /purchase_orders.json
  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)

    respond_to do |format|
      if @purchase_order.save
        format.html { redirect_to purchase_order_url(@purchase_order), notice: "Purchase order was successfully created." }
        format.json { render :show, status: :created, location: @purchase_order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purchase_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_orders/1 or /purchase_orders/1.json
  def update
    respond_to do |format|
      if @purchase_order.update(purchase_order_params)
        format.html { redirect_to purchase_order_url(@purchase_order), notice: "Purchase order was successfully updated." }
        format.json { render :show, status: :ok, location: @purchase_order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purchase_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_orders/1 or /purchase_orders/1.json
  def destroy
    @purchase_order.destroy

    respond_to do |format|
      format.html { redirect_to purchase_orders_url, notice: "Purchase order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    @q = params[:q]
    # Add your logic to perform the search based on the @q parameter
    @purchase_order = PurchaseOrder.where("name LIKE ?", "%#{@q}%")
  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_order
      @purchase_order = PurchaseOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purchase_order_params
      params.require(:purchase_order).permit(:total_price)
    end
end
