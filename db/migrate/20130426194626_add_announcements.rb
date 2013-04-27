class AddAnnouncements < ActiveRecord::Migration
  def self.up
    create_table :announcements do |t|
      t.string   :title
      t.text     :text
      t.string   :link
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :announcements
  end
end
