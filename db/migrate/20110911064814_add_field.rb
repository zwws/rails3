class AddField < ActiveRecord::Migration
  def up
  	add_column :events, :capacity, :integer
  end

  def down
  	remove_column
  end
end
