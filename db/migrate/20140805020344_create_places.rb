class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :longitute
      t.string :latitude

      t.timestamps
    end
  end
end
