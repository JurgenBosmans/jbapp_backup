class SoortPrestatie < ActiveRecord::Base
	belongs_to :user
	has_many :prestaties, :dependent => :destroy
	
	# has_many :onderhouden , :dependent => :destroy
	
	default_scope { order('created_at DESC') } #let op sortering later is niet meer mogelijk
	
	validates :soort, :presence => {:message => 'Je moet een soort opgeven'}
	
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable
	
	def soort_en_detail
		"#{soort} #{soort_detail}"
  	end
end
