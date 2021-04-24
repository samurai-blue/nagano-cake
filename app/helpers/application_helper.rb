module ApplicationHelper
    
  def flash_class_for flash_type
    case flash_type
      when 'success' then 'alert-success'
      when 'danger' then 'alert-danger'
      when 'info' then 'alert-info'
    end
  end
  
end
