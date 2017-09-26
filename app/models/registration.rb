require 'validates_email_format_of'
class Registration < ApplicationRecord
  belongs_to :event, :foreign_key=>'Event', :primary_key=>'id', optional: true
  validates :Name, presence: true, length: { in: 2..50}
  validates :Email, presence: true
  validates :Event, presence: true
  validates :Contact_no, presence: true, numericality: {only_integer: true },length: {is: 10}
  validates :Email, presence: true
  validates_email_format_of :Email
  validates :College, presence: true

end
