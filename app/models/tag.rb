class Tag < ApplicationRecord
  validates :content, :uniqueness => true, presence: true

end
