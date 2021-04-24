class ItemsController < ApplicationController
  # customer::消す？

def top
end

def index
  @items = Item.includes(:genre).where(genres: {validity: true}).is_active.page(params[:page]).per(9)
  # @items = Item.all.page(params[:page]).per(9)

end

def show
  @item = Item.find(params[:id])
  @cart = @item.cart_items.build
end

private

def item_params
    params.require(:item).permit(:image, :name, :description, :genre_id, :price, :is_saled)
end

end
