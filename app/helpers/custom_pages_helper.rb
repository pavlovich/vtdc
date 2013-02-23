module CustomPagesHelper

  def models
    Hobo::Model.all_models.sort_by &:name
  end

end
