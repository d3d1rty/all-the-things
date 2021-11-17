class Customer < ApplicationRecord
  has_many :loans

  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 25 }
  validates :phone_number, presence: true, length: { maximum: 13 }
  validates :address_line_one, presence: true, length: { maximum: 50 }
  validates :address_line_two, length: { maximum: 50 }
  validates :city, presence: true, length: { maximum: 25 }
  validates :state, presence: true, length: { maximum: 10 }
  validates :zip, presence: true, length: { maximum: 5 }

  def full_name
    "#{first_name} #{last_name}"
  end
end
