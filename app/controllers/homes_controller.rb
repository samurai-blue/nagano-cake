class HomesController < ApplicationController

  def top
    @items = Item.limit(20).order(" created_at DESC ")

  end

  def about
  end

end
