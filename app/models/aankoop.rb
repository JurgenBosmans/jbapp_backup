class Aankoop < ActiveRecord::Base
	belongs_to :user
	has_many :onderhouden , :dependent => :destroy
	
  before_save { self.winkel = winkel.upcase }
  
  #after_initialize :defaults
  
	default_scope { order('created_at DESC') } #let op sortering later is niet meer mogelijk
	
	validates :artikel, :presence => {:message => 'Je moet een artikel opgeven'}
	validates :soort, :presence => {:message => 'Je moet een categorie opgeven'}
	validates :prijs, numericality: true
  validates :prijs, :garantie_maanden, numericality: {greater_than_or_equal_to: 0}
	validates :aankoopdatum, :presence => {:message => 'Je moet een datum opgeven'}
	
	CATEGORIE = ["ANDER","AUTO","HIFI","ICT","INRICHTING","KEUKEN","SMARTPHONE"]
	
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable
  
 # def defaults
  #  self.prijs = "0"
   # self.garantie_maanden = "0"
  #end
end
