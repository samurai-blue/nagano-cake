class ItemsController < ApplicationController

def index
  @items = Item.all
  @item = Item.new
end

def show
  @item = Item.find(params[:id])
end

def new
  @item = Item.new
end

def create
  @item = Item.new(item_params)
  @item.save
  redirect_to items_path
end

def edit
  @item = Item.find(params[:id])
end

def update
  item = Item.find(params[:id])
  item.update(item_params)
  redirect_to item_path(item)
end

private

def item_params
    params.require(:item).permit(:image_id, :name, :description, :genre_id, :price, :is_saled)
end

end
