module ApplicationHelper
#Return title for each page
  def title
    base_title = "Agro Details"
    
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
    
  end
  
  def logo_image_helper
    image_tag("logo.png", :alt=>'Agro Details', :class=>'round')
  end    
end

