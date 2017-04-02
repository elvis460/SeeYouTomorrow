class AddFbToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :fb, :string
  end
end
