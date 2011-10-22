class AddUserToModels < ActiveRecord::Migration
  def change
    add_column :press_releases, :user_id, :integer
    add_column :media_outlets, :user_id, :integer
    add_column :reporters, :user_id, :integer
  end
end