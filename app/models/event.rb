class Event < ApplicationRecord
  has_many :registrations, :foreign_key=>'Event', :primary_key=>'Title'


  validates :Title, presence: true, length: {maximum: 50}
  validates :Description, presence: true
  validates :Venue, presence: true
  validates :Time, presence: true
  validates :Date, presence: true
  validates :Cost, presence: true, numericality: {only_integer: true }
  validates :Type, presence: true
  validates :CordinatorDetails, presence: true
  mount_uploader :add_photo, AddPhotoUploader

end
