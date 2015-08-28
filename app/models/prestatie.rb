class Prestatie < ActiveRecord::Base
	belongs_to :user
	belongs_to :persoon
	belongs_to :soort_prestatie
	
	# has_many :onderhouden , :dependent => :destroy
	
  default_scope { order('datum DESC') } #let op sortering later is niet meer mogelijk
	
	validates :persoon_id, :presence => {:message => 'Je moet een persoon opgeven'}
	validates :soort_prestatie_id, :presence => {:message => 'Je moet de soort van de prestatie opgeven'}
	validates :datum, :presence => {:message => 'Je moet een datum opgeven'}
	
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable
end
