class AddSmsCodeToDrivers < ActiveRecord::Migration[7.0]
  def change
    add_column :drivers, :sms_code, :string
  end
end
