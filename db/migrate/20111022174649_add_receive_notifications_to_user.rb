class AddReceiveNotificationsToUser < ActiveRecord::Migration
  def change
    add_column :users, :receive_notifications, :bool, :default => false
  end
end
