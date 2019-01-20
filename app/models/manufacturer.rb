class Manufacturer < ApplicationRecord
  has_many :cameras, dependent: :destroy
end
