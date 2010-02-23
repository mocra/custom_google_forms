Then /^I should see (no|\d+) "([^\"]*)" elements?$/ do |count, element|
  if count == "no"
    page.should_not have_xpath("//#{element}")
  else
    count = count.to_i
    page.should have_xpath("//#{element}")
    doc = Nokogiri::HTML(page.body)
    doc.xpath("//#{element}").length.should == count
  end
end

Then /^I should see no "([^\"]*)" attributes$/ do |attribute|
  page.should_not have_xpath("//*[@#{attribute}]")
end

