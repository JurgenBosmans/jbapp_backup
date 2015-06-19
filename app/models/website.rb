class Website < ActiveRecord::Base
	belongs_to :user
  	belongs_to :categorie 
  
	default_scope { order('sitenaam ASC') } 
	
  	validates :sitenaam, :categorie_id, :presence => true
  	validates :url, uniqueness: { message: "URL bestaat reeds" }
  
  	# CATEGORIES = [ "Computer", "Reizen", "Purchase order" ] 
  	# validates :categorie, inclusion: CATEGORIES
  
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable
  
  	# Pagination
  	# paginates_per 25
  
 	# Client.where("orders_count > 10").order(:name).reverse_order
 	# scope :top, -> { where(pay_type: :check) }
 	# scope :published, -> { where(published: true) }
  	#scope :recent_aangemaakt, -> { order('created_at DESC') }
  
  	#def self.search_and_order(search, page_number)
    #	if search
    #  		if Rails.env.development?
    #    		where("sitenaam LIKE ?", "%#{search}%").order(sitenaam: :asc).page page_number
    #  		elsif Rails.env.production?
    #    		where("sitenaam ILIKE ?", "%#{search}%").order(sitenaam: :asc).page page_number
    #  		end 
    # 	else
    #  		order(sitenaam: :asc).page page_number
    #	end
  	#end
end
