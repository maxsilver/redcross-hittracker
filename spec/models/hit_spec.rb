require 'spec_helper'

describe Hit do
  let(:reporter) { Reporter.create }
  let(:hit) { Hit.new }
  let(:user) { User.create }
  let(:press_release) { PressRelease.create }
  let(:media_outlet) { MediaOutlet.create }
    
  it "should save" do
    hit.save
    hit.errors.messages[:title].should include("can't be blank")
    hit.errors.messages[:reporter].should include("can't be blank")
    hit.errors.messages[:user].should include("can't be blank")
    hit.errors.messages[:reported_on].should include("can't be blank")
    hit.errors.messages[:media_outlet].should include("can't be blank")
    hit.errors.messages[:press_release].should include("can't be blank")
  end
  
  it "should not save when invalid" do
    hit.title = "A title"
    hit.reporter = reporter
    hit.user = user
    hit.reported_on = 2.weeks.ago
    hit.press_release = press_release
    hit.media_outlet = media_outlet
    hit.save
    hit.errors.should be_empty
  end  
end
