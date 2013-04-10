require 'spec_helper'

describe Record::TXT do

  it { Record::TXT.model_name.should == Record.model_name }
  it { subject.name.should == "TXT" }
end
