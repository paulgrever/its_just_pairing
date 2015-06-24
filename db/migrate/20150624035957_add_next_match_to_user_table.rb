class AddNextMatchToUserTable < ActiveRecord::Migration
  def change
    add_column :users, :next_match, :integer, default: 1
  end
end
