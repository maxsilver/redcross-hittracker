class CreateMediaOutlets < ActiveRecord::Migration
  def change
    create_table :media_outlets do |t|
      t.string :name
      t.string :media_type
      t.string :contact_name
      t.string :contact_phone
      t.integer :coverage_area

      t.timestamps
    end
  end
end
