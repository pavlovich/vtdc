module HoboFields
  module Types
    class RedactorText < HtmlString
      HoboFields.register_type(:rdtext, self)
    end
  end
end