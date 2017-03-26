class CreatePassengers < ActiveRecord::Migration[5.0]
  def change
    create_table :passengers do |t|
      t.string :name
      t.integer :gender
      t.string :major
      t.string :email
      t.string :facebook
      t.integer :admin_id

      t.timestamps
    end
  end
end
