class Admin < ActiveRecord::Base
  has_secure_password
  enum permission: {
      root: 0, 
      normal: 1
    }
  has_many :passengers
end
