class CreateHrDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name

      t.timestamps
    end
  end
end
