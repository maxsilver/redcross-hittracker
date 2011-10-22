class CreateWestMichiganRegion < ActiveRecord::Migration
  def up
    Region.create :name => "West Michigan"
  end

  def down
    Region.delete_all
  end
end
