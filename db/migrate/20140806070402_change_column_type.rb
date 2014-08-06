class ChangeColumnType < ActiveRecord::Migration
  def change
  	change_column :places, :longitute, :float
  	change_column :places, :latitude, :float
  end
end
