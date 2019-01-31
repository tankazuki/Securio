class Manufacturer < ApplicationRecord
  has_many :cameras, dependent: :destroy

  validates :manufacturer_name,  presence: true, length: { maximum: 20 }
end
