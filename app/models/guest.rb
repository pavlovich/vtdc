class Guest < Hobo::Model::Guest

  def administrator?
    false
  end

  def logged_in?
    false
  end

end
