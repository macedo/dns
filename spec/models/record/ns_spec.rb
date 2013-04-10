require 'spec_helper'

describe Record::NS do

  it { Record::NS.model_name.should == Record.model_name }
  it { subject.name.should == "NS" }
end
