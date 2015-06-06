module ApplicationHelper
  
  #time formater
  def ampm(time)
    if time.nil?
      return ""
    end
    time.strftime("%I:%M %p")
  end

  #inline error display helper
  def errors_list_for(object, field_name)
    if object.errors.any? && object.errors.messages[field_name]
      object.errors.messages[field_name].join(', ')
    end
  end

end
