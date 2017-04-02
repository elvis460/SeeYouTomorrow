class AddEmailToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :email, :string
  end
end
