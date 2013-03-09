class AddedFilledPositions < ActiveRecord::Migration
  def self.up
    create_table :filled_positions do |t|
      t.date     :from
      t.date     :to
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :member_id
      t.integer  :position_id
    end
    add_index :filled_positions, [:member_id]
    add_index :filled_positions, [:position_id]

    create_table :positions do |t|
      t.string   :name
      t.text     :description
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :filled_positions
    drop_table :positions
  end
end
