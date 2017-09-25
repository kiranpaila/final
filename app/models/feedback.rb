require 'validates_email_format_of'
VALID_NAME_REGEX = /\A[A-Za-z\d]([-\w]{2,20}[A-Za-z\d])?\Z/i
class Feedback < ApplicationRecord
  validates_email_format_of :email, :message => ':not valid email format'
  validates :name, presence: true, length: { in: 5..20 }, format: {with: VALID_NAME_REGEX, :message => 'name should be  5-20 character long and aplphanumeirc only'}
  validates :email, presence: true
  validates :message, presence: true

end
