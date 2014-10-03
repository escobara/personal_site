# text_field, text_area, check_box, :hidden 
class AdminFormBuilder < ActionView::Helpers::FormBuilder
  delegate :content_tag, :tag, to: :@template

  %w[text_field text_area password_field collection_select].each do |method_name|
    define_method(method_name) do |name, *args|
      content_tag :div, class: "form-group" do
      	# super arguments must be explicit
        field_label(name, *args) + tag(:br) + super(name, *args)
      end
    end
  end

  def check_box(name, *args)
    content_tag :div, class: 'form-group' do
      content_tag :div, class: 'checkbox' do 
        super + field_label(name, *args)
      end
    end
  end

  def error_messages
  	if object.errors.full_messages.any? 
  		content_tag(:div, :class => 'alert alert-dismissable alert-danger') do 
  			content_tag(:button, "x", class: 'close', data: { dismiss: 'alert'}) +
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
  	label(name, options[:label], class: ("required" if required))
  end

  def objectify_options(options)
  	super.except(:label)
  end
end