class TodoItem < ActiveRecord::Base
  belongs_to :todo

  def afgewerkt?
    !afgewerkt.blank?
  end
end
