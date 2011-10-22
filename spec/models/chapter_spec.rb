require 'spec_helper'

describe Chapter do
  let(:chapter) {Chapter.new}
  
  it "should save" do
    chapter.save
    chapter.errors.messages[:name].should include("can't be blank")
  end
  
  it "should not save when invalid" do
    chapter.name = "A name"
    chapter.save
    chapter.errors.should be_empty
  end
end
