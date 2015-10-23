class Werkwijze < ActiveRecord::Base
  	belongs_to :recept

	devise :database_authenticatable

	default_scope { order('created_at ASC') } #let op sortering later is niet meer mogelijk
end
