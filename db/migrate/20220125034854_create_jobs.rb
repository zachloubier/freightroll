class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :reference_number
      t.string :company_name
      t.references :driver, null: false, foreign_key: true

      t.timestamps
    end
  end
end
