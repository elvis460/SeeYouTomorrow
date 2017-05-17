class MatchMailer < ApplicationMailer
  def send_mail(ship_man_email, passenger_info, info_url)
    @passenger_name = passenger_info.name
    @passenger_email = passenger_info.email
    @info_url = info_url
    attachments.inline['login_1.png'] = File.read('public/backend_login_step/login_1.png')
    attachments.inline['login_2.png'] = File.read('public/backend_login_step/login_2.png')
    attachments.inline['login_3.png'] = File.read('public/backend_login_step/login_3.png')
    attachments.inline['login_4.png'] = File.read('public/backend_login_step/login_4.png')
    attachments.inline['login_5.png'] = File.read('public/backend_login_step/login_5.png')
    mail from: "Villager@tomorrow.com" , to: ship_man_email ,subject: "擺渡配對通知"
  end
end
