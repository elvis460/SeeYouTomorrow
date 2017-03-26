class Passenger < ApplicationRecord
  enum gender: { '女': 0, '男': 1 }
  belongs_to :admin
end
