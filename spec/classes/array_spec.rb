require 'spec_helper'

describe 'Array' do
  it "should be possible to find siblings" do
    [1,1,2,2,4,4,4,2,2].find_siblings(3).should == 4
  end
end
