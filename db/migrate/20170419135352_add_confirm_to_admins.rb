class AddConfirmToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :confirm, :boolean, default: false
  end
end
