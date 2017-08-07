class AddContactToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :fb, :string
    add_column :admins, :major, :string
  end
end
