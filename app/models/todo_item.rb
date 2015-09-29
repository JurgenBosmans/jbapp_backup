class TodoItem < ActiveRecord::Base
 belongs_to :todo

	  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable
	
  def afgewerkt?
    !afgewerkt.blank?
  end
end
