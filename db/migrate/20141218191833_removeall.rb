class Removeall < ActiveRecord::Migration
def down
    remove_column :statistics, :tabla
  
    remove_column :statistics, :nombreusuarios
    remove_column :statistics, :cantidad

  end
end
