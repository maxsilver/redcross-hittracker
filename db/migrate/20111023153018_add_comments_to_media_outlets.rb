class AddCommentsToMediaOutlets < ActiveRecord::Migration
  def change
    add_column :media_outlets, :comments, :text
  end
end
