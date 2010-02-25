class GoogleForm < ActiveRecord::Base
  validates_presence_of :title, :slug, :formkey
  validates_uniqueness_of :title, :slug, :formkey
  before_create :clean_formkey
  before_create :validate_formkey_is_valid
  
  def fetch_form_page
    uri = URI.parse(google_form_url)
    req = Net::HTTP::Get.new("#{uri.path}?#{uri.query}")
    response = Net::HTTP.new(uri.host).start {|h| h.request(req)}
    response
  end
  
  def submit(google_form_action, params)
    uri = URI.parse(google_form_action)
    req = Net::HTTP::Post.new("#{uri.path}?#{uri.query}")
    req.form_data = params
    response = Net::HTTP.new(uri.host).start {|h| h.request(req)}
    response
  end
  
  def google_form_url
    "http://spreadsheets.google.com/viewform?formkey=#{formkey}"
  end
  
  def clean_formkey
    if formkey =~ /=(.*)$/
      self.formkey = $1
    end
  end
  
  def validate_formkey_is_valid
    case fetch_form_page
    when Net::HTTPSuccess
      true
    else
      errors.add(:formkey, "is not a valid Google Forms key or URL or error connecting to Google")
      false
    end
  end
end
