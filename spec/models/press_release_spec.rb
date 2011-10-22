require 'spec_helper'

describe PressRelease do
  let(:press_release) { PressRelease.new }
  
  it "should save" do
    press_release.save
    press_release.errors.messages[:title].should include("can't be blank")
    press_release.errors.messages[:released_on].should include("can't be blank")
  end
  
  it "should not save when invalid" do
    press_release.title = "A title"
    press_release.released_on = 3.weeks.ago
    press_release.save
    press_release.errors.should be_empty
  end  
end
