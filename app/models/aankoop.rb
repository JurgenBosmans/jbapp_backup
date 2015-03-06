class Aankoop < ActiveRecord::Base
	belongs_to :user
	
	default_scope { order('updated_at DESC') } 
	
	validates :artikel, :presence => {:message => 'Je moet een artikel opgeven'}
	
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable
end
