require 'spec_helper'

describe Record::MX do

  it { Record::MX.model_name.should == Record.model_name }
  it { subject.name.should == "MX" }
end
