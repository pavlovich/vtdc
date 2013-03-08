class AddedCalendarAndEvents < ActiveRecord::Migration
  def self.up
    create_table :calendars do |t|
      t.string   :name
      t.string   :description
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :events do |t|
      t.string   :title
      t.datetime :starts_at
      t.datetime :ends_at
      t.boolean  :all_day
      t.text     :description
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :calendars
    drop_table :events
  end
end
