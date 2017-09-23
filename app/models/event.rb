class Event < ApplicationRecord 

  EVENTS = ['Play', 'Seminar', 'Workshop']

    validates :Title, presence: true
	  validates :Description, presence: true
    validates :Venue, presence: true, numericality: {only_integer: true },length: {is: 10}
    validates :Time, presence: true
    validates :Date, presence: true
    validates :Cost, presence: true
    validates :Department, presence: true
    validates :Type, presence: true
    validates :CordinatorDetails, presence: true
    validates :add_photo, presence: true

end
