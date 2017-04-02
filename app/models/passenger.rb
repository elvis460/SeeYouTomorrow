class Passenger < ApplicationRecord
  enum gender: { '女': 0, '男': 1 }
  belongs_to :admin

  after_create :send_mail_to_admins

  private
    def send_mail_to_admins
      Admin.where(permission: 0).each do |admin|
        ConfirmMailer.send_mail(self.admin, self, admin.email).deliver_now!
      end
    end
end
