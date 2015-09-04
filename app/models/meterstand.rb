class Meterstand < ActiveRecord::Base
	belongs_to :user
	
	default_scope { order('id DESC') } #let op sortering later is niet meer mogelijk
	
  after_initialize :defaults
  
	validates :meter, :presence => {:message => 'Je moet een meter opgeven'}
	validates :datum, :presence => {:message => 'Je moet een datum opgeven'}
	validates :stand, numericality: true
	validates :verbruik, numericality: true
  validates :stand, :verbruik, numericality: true
  
	METER = ["Ander","Gas","Water","Electriciteit"]
	
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable
  
  def defaults
    self.stand = "0"
    self.verbruik = "0"
  end
end
