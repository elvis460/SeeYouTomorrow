class CreatePassengerInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :passenger_infos do |t|
      t.string :psgr_no
      t.string :name
      t.string :major
      t.string :email
      t.text :tag_id

      t.timestamps
    end
  end
end
