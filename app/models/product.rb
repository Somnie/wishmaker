class Product < ActiveRecord::Base
  validates_numericality_of :desire, :less_than_or_equal_to => 100
  validates_numericality_of :price
  validates_presence_of :name, :price, :desire  
end

