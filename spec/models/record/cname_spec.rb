require 'spec_helper'

describe Record::CNAME do

  it { Record::CNAME.model_name.should == Record.model_name }
  it { subject.name.should == "CNAME" }
end
