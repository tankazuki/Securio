class Report < ApplicationRecord

  belongs_to :camera
  belongs_to :user

  validates :report_text, presence: true, length: { maximum: 200 }

end
