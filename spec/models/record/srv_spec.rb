require 'spec_helper'

describe Record::SRV do

  it { Record::SRV.model_name.should == Record.model_name }
  it { subject.name.should == "SRV" }
end
