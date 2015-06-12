class Bereiding < ActiveRecord::Base
	belongs_to :user
	belongs_to :recept
	
	default_scope { order('created_at DESC') } 
	
	validates :datum, :opmerking, :recept_id, :presence => {:message => 'Ontbrekende gegevens opgeven'}
	validates :score, :inclusion => { :in => 1..10, :message => "Scoren van 1 tot 10" }
	
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable	
end
