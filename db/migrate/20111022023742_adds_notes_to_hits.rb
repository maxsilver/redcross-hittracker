class AddsNotesToHits < ActiveRecord::Migration
  def up
    add_column :hits, :notes, :text
  end

  def down
    remove_column :hits, :notes
  end
end
