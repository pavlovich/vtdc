class DropFilledPositions < ActiveRecord::Migration
  def self.up
    drop_table :filled_positions
  end

  def self.down
    create_table "filled_positions", :force => true do |t|
      t.date     "from"
      t.date     "to"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
