class Year < ActiveRecord::Base
  has_many :statistics
  has_many :standings
end
