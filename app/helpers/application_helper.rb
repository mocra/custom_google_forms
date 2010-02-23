module ApplicationHelper
  def title(title)
    content_for(:title) { title }
  end
  
  def javascript(*files)
    content_for(:head) { javascript_include_tag(*files) }
  end
  
  def stylesheet(*files)
    content_for(:head) { styleshee_link_tag(*files) }
  end
end
