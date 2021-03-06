class Event < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title       :string
    starts_at   :datetime, :default => (DateTime.current - 4.hours)
    ends_at     :datetime, :default => (DateTime.current - 3.hours)
    all_day     :boolean
    description :rdtext
    timestamps
  end
  attr_accessible :title, :starts_at, :ends_at, :all_day, :description

  set_default_order "starts_at DESC"

  scope :before, lambda {|end_time| {:conditions => ["ends_at < ?", Event.format_date(end_time)] }}
  scope :current, lambda {|end_time| {:conditions => ["ends_at > ?", Event.format_date(end_time)] }}
  scope :past, lambda {|end_time| {:conditions => ["ends_at < ?", Event.format_date(end_time)] }}
  scope :after, lambda {|start_time| {:conditions => ["starts_at > ?", Event.format_date(start_time)] }}

  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
  end

  # --- Permissions --- #

  def create_permitted?
    acting_user.logged_in?
  end

  def update_permitted?
    acting_user.logged_in?
  end

  def destroy_permitted?
    acting_user.logged_in?
  end

  def view_permitted?(field)
    true
  end

end
