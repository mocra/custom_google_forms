class GoogleForm < ActiveRecord::Base
  
  def fetch_form_page
    form_url = "http://spreadsheets.google.com/viewform?formkey=#{formkey}"
    open(form_url).read
  end
  
  def submit(google_form_action, params)
    uri = URI.parse(google_form_action)
    
    uri = URI.parse(google_form_action)
    response = nil
    req = Net::HTTP::Post.new("#{uri.path}?#{uri.query}")
    req.form_data = params
    response = Net::HTTP.new(uri.host).start {|h| h.request(req)}
    response.body
  end
  
end
