class Watch < ApplicationRecord
  enum status: {avaible: 0, accepted: 1, flag: 2}
  has_many :bookings
  has_one_attached :photo
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
