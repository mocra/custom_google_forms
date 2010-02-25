class GoogleForm < ActiveRecord::Base
  before_validation :clean_formkey
  validates_presence_of :slug, :formkey
  validates_uniqueness_of :slug, :formkey
  validate :validate_formkey_is_valid
  
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
  
  def extract_form_title(body)
    doc = Nokogiri::HTML(body)
    doc.xpath("//h1[@class='ss-form-title']").first.text
  end
  
  def clean_formkey
    if formkey =~ /=(.*)$/
      self.formkey = $1
    end
  end
  
  def validate_formkey_is_valid
    case response = fetch_form_page
    when Net::HTTPSuccess
      self.title = extract_form_title(response.body)
      true
    else
      errors.add(:formkey, "is not a valid Google Forms key or URL or error connecting to Google")
      false
    end
  end
end
