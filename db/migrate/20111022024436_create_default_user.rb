class CreateDefaultUser < ActiveRecord::Migration
  def up
    User.create! email: "dberkowitz@ggr.redcross.org", password: "dberkowitz"
  end

  def down
    User.delete_all
  end
end
