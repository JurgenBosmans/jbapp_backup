class Arts < ActiveRecord::Base
	belongs_to :user
	has_many :dossiers , :dependent => :destroy
	# has_many :onderhouden , :dependent => :destroy
	
	default_scope { order('created_at DESC') } #let op sortering later is niet meer mogelijk
	
	validates :naam, :presence => {:message => 'Je moet een naam opgeven'}
	validates :specialiteit, :presence => {:message => 'Je moet een specialiteit opgeven'}
	
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable
end
