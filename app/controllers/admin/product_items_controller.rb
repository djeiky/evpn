class Admin::ProductItemsController < AdminController

  before_action :set_product_item, only: [:show, :edit, :update, :destroy]

  def index
    @product_items = ProductItem.all
  end

  def new
    @product_item = ProductItem.new
  end

  def edit
  end

  def create
    @item = ProductItem.new item_params
    if @item.save
      redirect_to admin_product_items_path
    else
      render :new
    end
  end

  def show
  end

  def update
    if @product_item.update item_params
      redirect_to admin_product_items_path
    else
      render :edit
    end
  end

  def destroy
    @product_item.destroy
    redirect_to admin_product_items_path
  end

  protected

  def item_params
    params.require(:product_item).permit(:name, :description, :cost, :product_type_id)
  end

  def set_product_item
    @product_item = ProductItem.find params[:id]
  end
end
