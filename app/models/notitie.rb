class Notitie < ActiveRecord::Base
    belongs_to :user
	
	default_scope { order('updated_at DESC') } 
	
	validates :notitie, :presence => {:message => 'Je moet een notitie opgeven'}
	
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable
end
