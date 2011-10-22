class CreateReporters < ActiveRecord::Migration
  def change
    create_table :reporters do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :fax
      t.text :comment

      t.timestamps
    end
  end
end
