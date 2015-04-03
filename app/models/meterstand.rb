class Meterstand < ActiveRecord::Base
	belongs_to :user
	
	default_scope { order('id DESC') } #let op sortering later is niet meer mogelijk
	
	validates :meter, :presence => {:message => 'Je moet een meter opgeven'}
	validates :datum, :presence => {:message => 'Je moet een datum opgeven'}
	validates :stand, numericality: true
	validates :verbruik, numericality: true
	
	METER = ["ANDER","GAS","WATER","ELECTRICITEIT"]
	
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable
end
