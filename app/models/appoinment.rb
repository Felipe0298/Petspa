class Appoinment < ApplicationRecord
  belongs_to :client, class_name: "User"
  belongs_to :appoinment_type
  belongs_to :pet
  belongs_to :local
  has_rich_text :notes
  validates :start_at, :end_at, presence: true
  enum status: { scheduled: 0, processing: 1, finished: 2 }
end
