class AddArraysToStatistics < ActiveRecord::Migration
  def change
  	add_column :statistics, :nombreusuarios, :array 
  	add_column :statistics,:cantidad, :array
  end
end
