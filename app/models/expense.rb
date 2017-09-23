class Expense < ApplicationRecord
     validates :for, presence: true
     validates :amount, presence: true, numericality: {only_integer: true }
end
