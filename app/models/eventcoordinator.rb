class Eventcoordinator < ApplicationRecord
validates :Name, presence: true,
                    length: { minimum: 6}
	
    validates :Contact_no, presence: true, numericality: {only_integer: true },length: {is: 10}
    validates :Email, presence: true, email_format: { message: "email should be : example@domain.com"}
end



 

 
