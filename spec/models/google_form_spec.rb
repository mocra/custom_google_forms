require 'spec_helper'

describe GoogleForm do
  before(:each) do
    @valid_attributes = {
      :slug => "value for slug",
      :formkey => "value for formkey"
    }
  end

  it "should create a new instance given valid attributes" do
    GoogleForm.create!(@valid_attributes)
  end
end
