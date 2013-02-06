module ApplicationHelper

	def absolute_attachment_url(attachment_name, attachment_style = :original)
  "#{request.protocol}#{request.host_with_port}#{attachment_name.url(attachment_style)}"
end
#And use it like this:
#<%= image_tag absolute_attachment_url(attachment_name, :attachment_style)}" %>
#  Ex: Model = Person (@person), attachment_name = avatar, style = :thumb
#  <%= image_tag absolute_attachment_url(@person.avatar, :thumb)}" %>

  def linkable_models
    (Hobo::Model.all_models.sort_by &:name).select { |m| linkable?(m, :index) }
  end

end
