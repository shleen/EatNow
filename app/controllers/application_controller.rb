class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def index
    @menu_items = MenuItem.all
  end
end
