class AddMajorToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :major, :string
  end
end
