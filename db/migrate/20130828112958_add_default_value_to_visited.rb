class AddDefaultValueToVisited < ActiveRecord::Migration
  def change
    change_column :links, :visited, :integer, default: 0
  end
end
