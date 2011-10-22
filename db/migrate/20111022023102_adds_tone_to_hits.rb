class AddsToneToHits < ActiveRecord::Migration
  def up
    add_column :hits, :tone, :string
  end

  def down
    remove_column :hits, :tone
  end
end
