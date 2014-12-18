class Columnasnuevas < ActiveRecord::Migration
  def change
 	add_column :statistics, :username, :Array 
  	add_column :statistics,:cant, :Array
 
  end
end
