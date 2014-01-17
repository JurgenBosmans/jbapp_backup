module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | JbappV2"      
    end
  end
end
