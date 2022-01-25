class AddIndexToDrivers < ActiveRecord::Migration[7.0]
  def change
    add_index :drivers, :phone, unique: true
  end
end
