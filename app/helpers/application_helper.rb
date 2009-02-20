module ApplicationHelper
  def registered_user_count
    Account.count
  end
  
  def nav_link(link_text, options={})
    if current_page?(options)
      content_tag(:li, link_to(link_text, options), :class => "current_link")
    else
      content_tag(:li, link_to(link_text, options), :class => "link")
    end
  end
end