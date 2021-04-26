class HomesController < ApplicationController

  def top
    # モデル名.order("並び替えたいカラム名")
  @items = Item.order(" id DESC ").limit(3)
  
    @items = Item.limit(20).order(" created_at DESC ")

  end

  def about
  end

end
