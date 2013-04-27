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



      include ActionView::Helpers::TagHelper
      include ActionView::Helpers::JavaScriptHelper

      def rdtext_area(object_name, method, options = {})
        options = (options || {}).stringify_keys
        options['class'] = (options['class'] ||= '') + 'redactor'

        instance_tag = ActionView::Base::InstanceTag.new(object_name, method, self, options.delete('object'))
        instance_tag.send(:add_default_name_and_id, options) if options['id'].blank?

        output_buffer = ActiveSupport::SafeBuffer.new
        output_buffer << instance_tag.to_text_area_tag(options)
        output_buffer
      end

end
