class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.string :tipo
      t.date :fechai
      t.date :fechaf

      t.timestamps
    end
  end
end
