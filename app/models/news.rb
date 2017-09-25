class News < ApplicationRecord
  validates_length_of :message, :in => 10..100, :message => '10-100 characters long only'
end
