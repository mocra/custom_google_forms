class OperateFormController < ApplicationController
  def show
    slug = params[:slug].first
    if @google_form = GoogleForm.find_by_slug(slug)
      form_html = @google_form.fetch_form_page
      
      doc = Nokogiri::HTML(form_html)
      doc.xpath("//*[@style]").remove_attr('style')
      doc.xpath("//link").each { |n| n.unlink }
      doc.xpath("//style").each { |n| n.unlink }
      
      css_node = doc.create_element('link')
      css_node["href"] = "/stylesheets/style.css"
      doc.xpath("//head").first.add_child(css_node)
      render :text => doc.to_html
    else
      redirect_to 'http://mocra.com'
    end
  end

end
