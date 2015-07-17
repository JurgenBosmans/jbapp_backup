class Product < ActiveRecord::Base
	belongs_to :user
	
	default_scope { order('created_at DESC') } #let op sortering later is niet meer mogelijk
	
	validates :naam, :presence => {:message => ': je moet een naam opgeven'}
	validates :prijs, numericality: true
	validates :score, :inclusion => { :in => 1..10, :message => "score van 1 tot 10" }
	
	
	SOORT = ["VLEES","GROENTE","FRUIT","GEBAK","ANDER","KRUID","BIER","WIJN","ALCOHOL","KAAS"]
	EH = ["STUK","KG","GRAM","CL","DL","ANDER"]
	
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable
end
