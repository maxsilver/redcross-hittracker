require 'spec_helper'

describe Reporter do
  let(:reporter) { Reporter.new }

  it "should save" do
    reporter.save
    reporter.errors.messages[:name].should include("can't be blank")
  end

  it "should not save when invalid" do
    reporter.name = "A name"
    reporter.save
    reporter.errors.should be_empty
  end  
end