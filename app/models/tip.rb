class Tip < ActiveRecord::Base
	belongs_to :user
	#has_many :onderhouden , :dependent => :destroy
	
	default_scope { order('created_at DESC') } #let op sortering later is niet meer mogelijk
	
	validates :tip, :presence => {:message => 'Je moet een tip opgeven'}
	
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable
end
