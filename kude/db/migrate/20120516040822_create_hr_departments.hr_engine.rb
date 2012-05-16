# This migration comes from hr_engine (originally 20120516034842)
class CreateHrDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name

      t.timestamps
    end
  end
end
