class Todo < ActiveRecord::Base
  has_many :todo_items, :dependent => :destroy
  belongs_to :user
  
  validates :naam, :beschrijving, :presence => true
end
