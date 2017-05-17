class AddMatchMailSentToPassengerInfos < ActiveRecord::Migration[5.0]
  def change
    add_column :passenger_infos, :match_mail_sent, :boolean , default: false
  end
end
