module ApplicationHelper

  def bootstrap_class_for flash_type
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-error"
      when :alert
        "alert-block"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end
  
  def admin_form_for(object, options={}, &proc)
    options = options.dup
    options[:builder] ||= AdminFormBuilder
    options[:html] ||= {}
    options[:html][:class] ||= 'horizontal-form'

    form_for(object, options, &proc)
  end

end
