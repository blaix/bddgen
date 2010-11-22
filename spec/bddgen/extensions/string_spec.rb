require 'spec_helper'

describe BDDGen::Extensions::String do
  it "adds a #camelize method to all strings" do
    "my string".methods.should include(:camelize)
    "your string".methods.should include(:camelize)
    "our string".methods.should include(:camelize)
  end
  
  describe '#camelize' do
    it "returns a capitilzed version of a simple string" do
      "yo".camelize.should == "Yo"
      "skullcrusher".camelize.should == "Skullcrusher"
    end
    
    it "returns a camel-cased version of an underscored string" do
      "voices_that_control_me".camelize.should == "VoicesThatControlMe"
      "fashion_police".camelize.should == "FashionPolice"
    end
    
    it "returns a camel-cased version of a dashed string" do
      "use-passenger".camelize.should == "UsePassenger"
      "send-my-regards".camelize.should == "SendMyRegards"
    end
    
    it "returns a camel-cased version of a string with spaces" do
      "the youth fountain".camelize.should == "TheYouthFountain"
      "it hurts".camelize.should == "ItHurts"
    end
    
    it "returns a camel-cased version of a string with underscores, dashes, and spaces" do
      "shuffled up-sixth_street".camelize.should == "ShuffledUpSixthStreet"
    end
    
    it "doesn't choke on multiple sequential dashes, spaces, or underscores" do
      " they___come-_ out  to__-smoke".camelize.should == "TheyComeOutToSmoke"
    end
  end
end