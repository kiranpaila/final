require 'validates_email_format_of'
class Eventcoordinator < ApplicationRecord

  validates :Name, presence: true, length: { minimum: 6}
  validates :Contact_no, presence: true, numericality: {only_integer: true },length: {is: 10}
  validates :Email, presence: true
  validates_email_format_of :Email

end
