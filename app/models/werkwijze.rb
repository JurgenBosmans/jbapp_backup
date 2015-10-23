class Werkwijze < ActiveRecord::Base
  	belongs_to :recept

	devise :database_authenticatable
end
