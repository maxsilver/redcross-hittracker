class CreateHits < ActiveRecord::Migration
  def change
    create_table :hits do |t|
      t.string  :title
      t.integer :user_id
      t.integer :media_outlet_id
      t.integer :chapter_id
      t.text    :content 
      t.integer :reporter_id
      t.date    :reported_on

      t.timestamps
    end
  end
end
