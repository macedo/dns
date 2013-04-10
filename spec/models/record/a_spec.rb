require 'spec_helper'

describe Record::A do

  it { Record::A.model_name.should == Record.model_name }
  it { subject.name.should == "A" }
end
