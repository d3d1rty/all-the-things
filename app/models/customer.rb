class Customer < ApplicationRecord
  has_many :loans, dependent: :destroy

  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 25 }
  validates :phone_number, phone: true
  validates :address_line_one, presence: true, length: { maximum: 50 }
  validates :address_line_two, length: { maximum: 50 }
  validates :city, presence: true, length: { maximum: 25 }
  validates :state, presence: true, length: { maximum: 10 }
  validates :zip, presence: true, length: { maximum: 10 }, format: { with: /\A\d{5}(-\d{4})?\z/, message: 'should be in the form 12345 or 12345-1234' }

  def full_name
    "#{first_name} #{last_name}"
  end
end
