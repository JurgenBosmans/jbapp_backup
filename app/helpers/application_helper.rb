module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | JbappV2"      
    end
  end
  
  def glyph(*names)
    content_tag :i, nil, class: names.map{|name| "icon-#{name.to_s.gsub('_','-')}" }
  end

 def hyperlink(text)
    return text.gsub(/((http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?)/, '<a target="blank" href=\'\1\'>\1</a>').html_safe
  end

end
