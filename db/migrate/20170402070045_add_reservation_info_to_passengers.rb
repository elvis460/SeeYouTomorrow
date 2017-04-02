class AddReservationInfoToPassengers < ActiveRecord::Migration[5.0]
  def change
    add_column :passengers, :date, :string
    add_column :passengers, :location, :string
  end
end
