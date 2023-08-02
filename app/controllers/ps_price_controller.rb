class PsPriceController < ApplicationController
  
  #debugger
  def index
    @product_suppliers = ProductSupplier.includes(:product, :supplier)
  end

  def create
    product_suppliers = ProductSupplier.where(id: params[:selected_ps])
    po = PurchaseOrder.new
    po_total_price = 0
    po.stuff_id = current_stuff.id
    product_suppliers.each do |ps|
      line_item =  po.line_items.build
      line_item.product_id = ps.product_id
      line_item.supplier_id = ps.supplier_id
      line_item.quantity = 1
      line_item.uint_price = ps.price
      line_item.total_price = line_item.quantity * line_item.uint_price
      po_total_price += line_item.total_price
    end
    po.total_price = po_total_price

    if po_total_price != 0
        po.save!
        redirect_to po
    else
      redirect_to ps_price_create_path
    end

  end

  def create_order
    @product_suppliers = ProductSupplier.includes(:product, :supplier)
  end
  def details

    params.permit!

    po_id = params[:format]
    @purchase_order = PurchaseOrder.find(po_id)

  end





end
