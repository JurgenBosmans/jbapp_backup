class Recept < ActiveRecord::Base
	belongs_to :user
	#has_many :onderhouden , :dependent => :destroy
	
	default_scope { order('created_at DESC') } #let op sortering later is niet meer mogelijk
	
	validates :naam, :presence => {:message => 'Naam van het gerecht moet aanwezig zijn'}
	validates :moeilijkheidsgraad, :personen, :bereidingstijd, numericality: true
	
	BRON = ["ANDER","DAGELIJKSE KOST","WEBSITE","BOEK","MAGAZINE","INTERNET","CURSUS","TV"]
	SOORT = ["ANDER","DRANK","SOEP","VOORGERECHT","HOOFDSCHOTEL","DESSERT","BIJGERECHT","GEBAK"]
	
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable
end
