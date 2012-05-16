class CreateHrEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.references :department

      t.timestamps
    end
    add_index :employees, :department_id
  end
end
