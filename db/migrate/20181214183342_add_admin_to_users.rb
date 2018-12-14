class AddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean, default: false # if this column is not filled in its false. 
                # you do not wnat everyone to be admin
  end
end
