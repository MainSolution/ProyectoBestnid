class AddTransaccionToUser < ActiveRecord::Migration
  def change
  	add_column :articles, :transaccion, :string
  end
end
