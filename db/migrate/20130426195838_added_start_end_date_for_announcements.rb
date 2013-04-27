class AddedStartEndDateForAnnouncements < ActiveRecord::Migration
  def self.up
    add_column :announcements, :start_date, :date
    add_column :announcements, :end_date, :date
    add_column :announcements, :publicly_visible, :boolean
  end

  def self.down
    remove_column :announcements, :start_date
    remove_column :announcements, :end_date
    remove_column :announcements, :publicly_visible
  end
end
