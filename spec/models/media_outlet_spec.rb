require 'spec_helper'

describe MediaOutlet do
  let(:media_outlet) { MediaOutlet.new }
    
  it "should save" do
    media_outlet.save
    media_outlet.errors.messages[:name].should include("can't be blank")
    media_outlet.errors.messages[:media_type].should include("can't be blank")
  end
  
  it "should not save when invalid" do
    media_outlet.name = "Name"
    media_outlet.media_type = "T.V."
    media_outlet.save
    media_outlet.errors.should be_empty
  end
end
