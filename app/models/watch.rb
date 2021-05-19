class Watch < ApplicationRecord
  enum status: {avaible: 0, accepted: 1, flag: 2} 
  has_one_attached :photo
  belongs_to :user

end
