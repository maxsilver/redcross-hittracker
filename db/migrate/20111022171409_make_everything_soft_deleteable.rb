class MakeEverythingSoftDeleteable < ActiveRecord::Migration
  def up
    add_column :chapters, :deleted_at, :datetime
    add_column :hits, :deleted_at, :datetime
    add_column :media_outlets, :deleted_at, :datetime
    add_column :press_releases, :deleted_at, :datetime
    add_column :reporters, :deleted_at, :datetime
    add_column :regions, :deleted_at, :datetime
    add_column :users, :deleted_at, :datetime
    add_column :taggings, :deleted_at, :datetime
    add_column :tags, :deleted_at, :datetime
  end

  def down
    remove_column :chapters, :deleted_at
    remove_column :hits, :deleted_at
    remove_column :media_outlets, :deleted_at
    remove_column :press_releases, :deleted_at
    remove_column :reporters, :deleted_at
    remove_column :regions, :deleted_at
    remove_column :users, :deleted_at
    remove_column :taggings, :deleted_at
    remove_column :tags, :deleted_at
  end
end
