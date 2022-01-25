class Job < ApplicationRecord
  belongs_to :driver

  validates :name, presence: true
  validates :company_name, presence: true
  validates :reference_number, presence: true
end
