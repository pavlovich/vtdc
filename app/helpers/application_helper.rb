module ApplicationHelper

	def absolute_attachment_url(attachment_name, attachment_style = :original)
  "#{request.protocol}#{request.host_with_port}#{attachment_name.url(attachment_style)}"
end
#And use it like this:
#<%= image_tag absolute_attachment_url(attachment_name, :attachment_style)}" %>
#  Ex: Model = Person (@person), attachment_name = avatar, style = :thumb
#  <%= image_tag absolute_attachment_url(@person.avatar, :thumb)}" %>

  def get_blank_message_opts()
    blank_message = ht("#{this_type.name.underscore}.#{this_field}.messages.none", :default=>"No #{this_type.model_name.human} available.")
    { :blank_message => blank_message }
  end

  def check_blank_message(blank_message)
    blank_message.inspect
  end

end
