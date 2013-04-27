class Announcement < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title :string
    text  :rdtext
    link  :string
    start_date :date
    end_date   :date
    publicly_visible :boolean
    timestamps
  end
  attr_accessible :title, :text, :start_date, :end_date, :publicly_visible, :link

  def self.for_latest_list
    Announcement.where( :publicly_visible => true ).where('start_date <= ?', Announcement.format_date(DateTime.now) ).where('end_date >= ?', Announcement.format_date(DateTime.now)).all
  end

  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
  end

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
