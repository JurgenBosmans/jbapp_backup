module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | JbappV2"      
    end
  end
  
  def glyph(*names)
    content_tag :i, nil, class: names.map{|name| "icon-#{name.to_s.gsub('_','-')}" }
  end

end
