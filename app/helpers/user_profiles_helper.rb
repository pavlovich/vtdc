module UserProfilesHelper

  def show_fields
    # standard_fields(:belongs_to).*.to_s - [model.name_attribute, main_content, creator, back_link, *boolean_fields].*.to_s
    ["bio"]
  end

end
