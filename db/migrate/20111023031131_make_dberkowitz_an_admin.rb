class MakeDberkowitzAnAdmin < ActiveRecord::Migration
  def up
    if user = User.find_by_email("dberkowitz@ggr.redcross.org")
      user.update_attributes!(:admin => true)
    end
  end

  def down
  end
end
