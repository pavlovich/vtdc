class CleanUpPositions < ActiveRecord::Migration
  def self.up
    add_column :positions, :member_id, :integer

    add_index :positions, [:member_id]
  end

  def self.down
    remove_column :positions, :member_id

    remove_index :positions, :name => :index_positions_on_member_id rescue ActiveRecord::StatementInvalid
  end
end
