class Admin::ProductTypesController < AdminController

  before_action :set_product_type, only: [:edit, :destroy, :update]

  def index
    @product_types = ProductType.all
  end

  def new
    @product_type = ProductType.new
  end

  def edit
  end

  def create
    @product_type = ProductType.new type_params
    if @product_type.save
      redirect_to admin_product_types_path
    else
      render :new
    end
  end

  def destroy
    @product_type.destroy
    redirect_to admin_product_types_path
  end

  def update
    if @product_type.update type_params
      redirect_to admin_product_types_path
    else
      render :edit
    end

  end

  protected

  def set_product_type
    @product_type = ProductType.find params[:id]
  end

  def type_params
    params.require(:product_type).permit(:name, :image, :tempfile, :description)
  end
end
