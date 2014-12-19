class Notitie < ActiveRecord::Base
    belongs_to :user
    validates :notitie, :presence => true
  #validates :url, :presence => {:message => 'URL cannot be blank.'}, format: {with: /\A[www]+[A-Za-z0-9._%+-]+\.[A-Za-z]+\z/, message: 'INCORRECT FORMAT!'}
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable
  
  # Pagination
  paginates_per 20
  
 # Client.where("orders_count > 10").order(:name).reverse_order
 # scope :top, -> { where(pay_type: :check) }
 # scope :published, -> { where(published: true) }
  
  def self.search_and_order(search, page_number)
    if search
      if Rails.env.development?
        where("sitenaam LIKE ?", "%#{search}%").order(sitenaam: :asc).page page_number
      elsif Rails.env.production?
        where("sitenaam ILIKE ?", "%#{search}%").order(sitenaam: :asc).page page_number
      end 
    else
      order(sitenaam: :asc).page page_number
    end
  end
end
