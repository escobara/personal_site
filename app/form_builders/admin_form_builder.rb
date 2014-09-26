# text_field, text_area, check_box, :hidden 
class AdminFormBuilder < ActionView::Helpers::FormBuilder

	# def text_field(name, *args)
	# 	@template.content_tag :div, class: 'form-group' do
	# 		label(name) + @template.tag(:br) + super			
	# 	end
	# end

  %w[text_field text_area password_field collection_select].each do |method_name|
    define_method(method_name) do |name, *args|
      @template.content_tag :div, class: "form-group" do
      	# super arguments must be explicit
       field_label(name, *args) + @template.tag(:br) + super(name, *args)
      end
    end
  end

  def error_messages
  	if object.errors.full_messages.any? 
  		content_tag(:div, :class => 'error_messages') do 
  			content_tag(:h4, "Invalid Fields") + 
  			content_tag(:ul) do
          object.errors.full_messages.map do |msg|
            content_tag(:li, msg)
          end.join.html_safe
        end
  		end
  	end
  end

  private

  def field_label(name, *args)
  	options = args.extract_options!
  	required = object.class.validators_on(name).any? {|v| v.kind_of? ActiveModel::Validations::PresenceValidator}
  	label(name, options[:label], class: ("col-lg-2 control-label required" if required))
  end

  def objectify_options(options)
  	super.except(:label)
  end
end