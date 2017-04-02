class ConfirmMailer < ApplicationMailer
  def send_mail(ship_man, passenger, email)
    @passenger_name = passenger.name
    @ship_man = ship_man.name
    @reservation_date = passenger.date
    @reservation_location = passenger.location
    mail from: "Villager@tomorrow.com" , to: email ,subject: "擺渡敲定"
  end
end
