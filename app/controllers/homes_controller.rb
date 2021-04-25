class HomesController < ApplicationController

  def top
<<<<<<< HEAD
    @items = Item.limit(20).order(" created_at DESC ")

=======
    # モデル名.order("並び替えたいカラム名")
  @items = Item.order(" id DESC ").limit(3)
  
>>>>>>> origin/taku
  end

  def about
  end

end
