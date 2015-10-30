class Recept < ActiveRecord::Base
	belongs_to :user
	has_many :ingredienten , :dependent => :destroy
	has_many :werkwijzen , :dependent => :destroy
	has_many :bereidingen , :dependent => :destroy

	#has_many :onderhouden , :dependent => :destroy

	default_scope { order('created_at DESC') } #let op sortering later is niet meer mogelijk

  	#after_initialize :defaults


	accepts_nested_attributes_for :ingredienten, reject_if: proc { |attributes| attributes['naam'].blank? }, allow_destroy: true
 	accepts_nested_attributes_for :werkwijzen, reject_if: proc { |attributes| attributes['stap'].blank? }, allow_destroy: true



	validates :naam, :presence => {:message => 'Naam van het gerecht moet aanwezig zijn'}
	validates :moeilijkheidsgraad, :personen, :bereidingstijd, numericality: true

	BRON = ["ANDER","DAGELIJKSE KOST","WEBSITE","BOEK","MAGAZINE","INTERNET","CURSUS","TV","BOEK BIB"]
	SOORT = ["ANDER","DRANK","SOEP","VOORGERECHT","HOOFDSCHOTEL","DESSERT","BIJGERECHT","GEBAK","AMUSE","SAUS"]

  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable

  #def defaults
   # self.bereidingstijd = "0"
    #self.moeilijkheidsgraad = "0"
    #self.personen="0"
 # end

end
