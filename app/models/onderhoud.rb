class Onderhoud < ActiveRecord::Base
	belongs_to :user
	belongs_to :aankoop
	
	default_scope { order('created_at DESC') } 
	
  #after_initialize :defaults
  
	validates :aankoop_id, :presence => {:message => 'Je moet een artikel opgeven'}
	validates :datum_onderhoud, :presence => {:message => 'Je moet een datum opgeven'}
  validates :prijs, :teller, numericality: true
	
	EH = ["KM","ANDER"]
	
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable
  
  #def defaults
   # self.prijs = "0"
    #self.teller = "0"
  #end
end
