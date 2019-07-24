require_relative 'application_record'
class Restaurant < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :cost, presence: true
  
end