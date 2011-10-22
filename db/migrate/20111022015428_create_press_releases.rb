class CreatePressReleases < ActiveRecord::Migration
  def change
    create_table :press_releases do |t|
      t.string :title
      t.date :released_on

      t.timestamps
    end
  end
end
