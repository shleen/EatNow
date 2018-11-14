class MenuItemController < ApplicationController
  def new
    @mi = MenuItem.new

    get_menu_item_types
  end

  def create
    m = MenuItem.new
    m.update(stall_id: current_user.stall_id)
    m.update(menu_item_params)

    flash[:notice] = "Menu item added!"
    redirect_back fallback_location: root_path
  end

  private

  def menu_item_params
    params.require(:menu_item).permit(:name, :price, :waiting_time, :vegetarian, :desc)
  end

  def get_menu_item_types
    @mi_types = [
      ['Food', 'food'],
      ['Drink', 'drink'],
      ['Snack', 'snack'],
      ['Combo', 'combo'],
      ['Other', 'other']
    ]
  end
end
