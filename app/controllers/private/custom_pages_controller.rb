class Private::CustomPagesController < Private::PrivateSiteController

  hobo_model_controller

  #before_filter :login_required

  auto_actions :all



  #def hobo_create(*args, &b)
  #  super
  #  save_snapshot
  #end

  #def hobo_update(*args, &b)
  #  options = args.extract_options!
  #
  #  self.this ||= args.first || find_instance
  #  changes = options[:attributes] || attribute_parameters or raise RuntimeError, t("hobo.messages.update.no_attribute_error", :default=>["No update specified in params"])
  #
  #  if this.user_update_attributes(current_user, changes)
  #    # Ensure current_user isn't out of date
  #    @current_user = @this if @this == current_user
  #    save_snapshot
  #  end
  #
  #  response_block(&b) ||  update_response(nil, options)
  #end
  #
  #def save_snapshot
  #  model=CustomPage.find(params[:id])
  #  #html=render_to_string({:template => "private/custom_pages/show_custom_content"})
  #  #kit=IMGKit.new(html)
  #  #kit=IMGKit.new("http://www.totaldoberman.com/static/" + model.slug)
  #  #img=kit.to_img(:png)
  #  #file=Tempfile.new(["custom_page_#{model.id}_snapshot",'png'],'tmp',:encoding=>'ascii-8bit')
  #  #file.write(img)
  #  #file.flush
  #  #model.snapshot=file
  #  model.snapshot=nil
  #  model.save
  #  #file.unlink
  #end


  #def create_snapshot()
  #
  #  html  = self.contents
  #  kit   = IMGKit.new(html)
  #  img   = kit.to_img(:png)
  #  file  = Tempfile.new(["template_#{UUIDTools::UUID.timestamp_create}", 'png'], 'tmp',
  #                       :encoding => 'ascii-8bit')
  #  file.write(img)
  #  file.flush
  #  self.snapshot = file
  #  @my_temp_file = file
  #end
  #
  #def cleanup_snapshot_temp_file
  #  @my_temp_file.unlink
  #end

end
