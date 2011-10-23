class NameTheFirstUser < ActiveRecord::Migration
  def up
    User.first.update_attribute(:name, "Deanna Berkowitz")
  end

  def down
  end
end
