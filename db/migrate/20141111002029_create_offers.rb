class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.text :contenido
      t.float :precio, default: "0"
      t.string :estado, default: "En espera"


      t.timestamps
    end
  end
end
