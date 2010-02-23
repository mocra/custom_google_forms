class GoogleForm < ActiveRecord::Base
  
  def fetch_form_page
    form_url = "http://spreadsheets.google.com/viewform?formkey=#{formkey}"
    open(form_url).read
  end
  
end
