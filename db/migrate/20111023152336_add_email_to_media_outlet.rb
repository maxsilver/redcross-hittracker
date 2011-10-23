class AddEmailToMediaOutlet < ActiveRecord::Migration
  def change
    add_column :media_outlets, :email, :string
  end
end
