class Admin::MenusController < AdminController

  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
    10.times {@menu.menu_items.build}
  end

  def create
    @menu = Menu.new menu_params
    if @menu.save
      redirect_to admin_menus_path
    else
      render :new
    end
  end

  def update
    @menu = Menu.find params[:id]
    if @menu.update(menu_params)
      redirect_to admin_menus_path
    else
      render :edit
    end

  end

  def edit
    @menu = Menu.find params[:id]
    10.times {@menu.menu_items.build}

  end

  def destroy
    @menu = Menu.find params[:id]
    @menu.destroy
    redirect_to admin_menus_path
  end

  protected

  def menu_params
    params.require(:menu).permit(:name, menu_items_attributes: [:id, :title, :url])
  end
end
