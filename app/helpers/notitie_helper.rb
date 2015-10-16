module NotitieHelper
	def hyperlink(text)
    	return text.gsub(/((http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?)/, '<a target="_blank" href=\'\1\'>\1</a>').html_safe
  end
end
