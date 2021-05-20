class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :watch
  validate :date_end_after_date_start

  private

  def date_end_after_date_start
    if self[:end_date] < self[:start_date]
      errors[:end_date] << "not valid"
      return false
    else
      return true
    end
  end
end
