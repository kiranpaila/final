class Registration < ApplicationRecord
  belongs_to :event, :foreign_key=>'Event', :primary_key=>'id', optional: true
  validates :Name, presence: true,
  length: { minimum: 6}
  validates :Event, presence: true
  validates :Contact_no, presence: true, numericality: {only_integer: true },length: {is: 10}
  validates :Email, presence: true, email_format: { message: "email should be : example@domain.com"}
  validates :College, presence: true

end
