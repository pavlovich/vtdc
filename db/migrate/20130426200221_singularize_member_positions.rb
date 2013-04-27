class SingularizeMemberPositions < ActiveRecord::Migration
  def self.up
    drop_table :members_positions
  end

  def self.down
    create_table "members_positions", :id => false, :force => true do |t|
      t.integer "member_id"
      t.integer "position_id"
    end
  end
end
