class Website < ActiveRecord::Base
  belongs_to :user
  belongs_to :categorie
  
  validates :sitenaam, :categorie_id, :presence => true
  #validates :url, :presence => {:message => 'URL cannot be blank.'}, format: {with: /\A[www]+[A-Za-z0-9._%+-]+\.[A-Za-z]+\z/, message: 'INCORRECT FORMAT!'}
  validates :url, uniqueness: { message: "URL bestaat reeds" }
  
  # CATEGORIES = [ "Computer", "Reizen", "Purchase order" ] 
  # validates :categorie, inclusion: CATEGORIES
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable
  
  # Pagination
  paginates_per 20
  
 # Client.where("orders_count > 10").order(:name).reverse_order
 # scope :top, -> { where(pay_type: :check) }
 # scope :published, -> { where(published: true) }
  scope :recent_aangemaakt, -> { order('created_at DESC') }
  
  def self.search_and_order(search, page_number)
    if search
      where("sitenaam LIKE ?", "%#{search}%").order(
        sitenaam: :asc).page page_number
    else
      order(sitenaam: :asc).page page_number
    end
  end
end
