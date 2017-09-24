class Fund < ApplicationRecord

  validates :sponsor, presence: true
  validates :amount, presence: true, numericality: {only_integer: true }
  validates :status, presence: true
  validates :event, presence: true
end
