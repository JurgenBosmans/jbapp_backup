class Recept < ActiveRecord::Base
	belongs_to :user
	#has_many :onderhouden , :dependent => :destroy
	
	default_scope { order('created_at DESC') } #let op sortering later is niet meer mogelijk
	
  #after_initialize :defaults
  
	validates :naam, :presence => {:message => 'Naam van het gerecht moet aanwezig zijn'}
	validates :moeilijkheidsgraad, :personen, :bereidingstijd, numericality: true
  validates :bereidingstijd, :moeilijkheidsgraad, :personen, numericality: true
  
	BRON = ["ANDER","DAGELIJKSE KOST","WEBSITE","BOEK","MAGAZINE","INTERNET","CURSUS","TV","BOEK BIB"]
	SOORT = ["ANDER","DRANK","SOEP","VOORGERECHT","HOOFDSCHOTEL","DESSERT","BIJGERECHT","GEBAK","AMUSE"]
	
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable
  
  #def defaults
   # self.bereidingstijd = "0"
    #self.moeilijkheidsgraad = "0"
    #self.personen="0"
 # end
   
end
