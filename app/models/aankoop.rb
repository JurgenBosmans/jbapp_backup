class Aankoop < ActiveRecord::Base
	belongs_to :user
	has_many :onderhouden , :dependent => :destroy
	
	default_scope { order('updated_at DESC') } #let op sortering later is niet meer mogelijk
	
	validates :artikel, :presence => {:message => 'Je moet een artikel opgeven'}
	validates :soort, :presence => {:message => 'Je moet een categorie opgeven'}
	validates :prijs, numericality: true
	validates :aankoopdatum, :presence => {:message => 'Je moet een datum opgeven'}
	
	CATEGORIE = ["ANDER","AUTO","HIFI","ICT","INRICHTING","KEUKEN","SMARTPHONE"]
	
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable
end
