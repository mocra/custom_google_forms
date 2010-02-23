class GoogleForm < ActiveRecord::Base
  
  def fetch_form_page
    form_url = "http://spreadsheets.google.com/viewform?formkey=#{formkey}"
    open(form_url).read
  end
  
  def submit(google_form_action, params)
    res = Net::HTTP.post_form(URI.parse(google_form_action), params)
    res.body
  end
  
end
