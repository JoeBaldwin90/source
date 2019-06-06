class ItemsController < ApplicationController

  def index

    if params[:q].present?
      @items = Item.where("lower(title) LIKE ?", "%" + params[:q].downcase + "%") # lower() is SQL, .downcase is Ruby
    else
      @items = Item.all
    end

  end

  def show
    @item = Item.find(params[:id])
  end

end
