class Todo < ActiveRecord::Base
  has_many :todo_items, :dependent => :destroy
  belongs_to :user
  
  validates :naam, :beschrijving, :presence => true
	
	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable
end
