module ApplicationHelper
    
  def flash_class_for flash_type
    case flash_type
      when 'success' then 'alert-success'
      when 'danger' then 'alert-danger'
      when 'info' then 'alert-info'
    end
  end
  
  def price_include_tax(price)
    price = price * 1.08
    "#{price.round}円"
  end
  
  # def price_include_tax(price)
  #   price = price * 1.08
  #   "#{price.floor}円"
  # end
  
end
