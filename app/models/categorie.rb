class Categorie < ActiveRecord::Base
	has_many :websites #, dependent: :destroy
	
	default_scope { order('omschrijving ASC') } 
	
	validates :omschrijving, :presence => {:message => '=> moet je opgeven'}
	validates :omschrijving, length: { in: 1..20, too_long: "=> te lang", too_short: "=> te kort" }
	
	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable
end
