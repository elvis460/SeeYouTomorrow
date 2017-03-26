class AddPermissionToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :permission, :integer
  end
end
