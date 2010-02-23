class OperateFormController < ApplicationController
  def show
    slug = params[:slug].first
    if @google_form = GoogleForm.find_by_slug(slug)
      form_html = @google_form.fetch_form_page
      doc = clean_up_html(form_html)
      render :text => doc.to_html
    else
      redirect_to 'http://mocra.com'
    end
  end
  
  def update
    if @google_form = GoogleForm.find(params[:id])
      params.delete(:id)
      params.delete(:action)
      params.delete(:controller)
      google_form_action = params.delete(:google_form)
      result_html = @google_form.submit(google_form_action, params)
      if result_html =~ %r{<title>Thanks!<\/title>}
        render :text => "Thanks for your answers."
      elsif result_html =~ /Moved Temporarily/
        render :text => "Ooh, this form has been moved or disabled. How odd."
      else
        if doc = clean_up_html(result_html)
          render :text => doc.to_html
        else
          render :text => result_html
        end
      end
    end
  end
  
  private
  def clean_up_html(form_html)
    doc = Nokogiri::HTML(form_html)
    doc.xpath("//*[@style]").remove_attr('style')
    doc.xpath("//*[@class='ss-legal']").each { |n| n.unlink }
    doc.xpath("//link").each { |n| n.unlink }
    doc.xpath("//style").each { |n| n.unlink }

    # add 'clearfix' to wrap
    # doc.xpath("//*[@class='ss-form-container']").add_class('clearfix');
    
    google_form = doc.xpath("//form").first
    return false unless google_form
    google_form_action = google_form["action"]
    google_form["action"] = submit_operate_form_url(:id => @google_form.id, :google_form => google_form_action)
    
    css_node = doc.create_element('link')
    css_node["href"] = "/stylesheets/style.css"
    css_node["rel"] = "stylesheet"
    css_node["type"] = "text/css"
    doc.xpath("//head").first.add_child(css_node)
    doc
  end
end
