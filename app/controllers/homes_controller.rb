class HomesController < ApplicationController
  
  def top
    # モデル名.order("並び替えたいカラム名")
  @items = Item.limit(4).order(" id DESC ")
  
  end
  
  def about
  end
  
end
