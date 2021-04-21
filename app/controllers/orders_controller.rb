class OrdersController < ApplicationController
  
  before_action :authenticate_customer!
  
  def index
  end

  def show
  end

  def create
  end

  def new
    @oder = Oder
  end

  def check
  end

  def finish
  end
end
