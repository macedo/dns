require 'spec_helper'

describe Record do

  describe 'accessible attributes' do
    it { should allow_mass_assignment_of :name }
    it { should allow_mass_assignment_of :values }
  end

  describe 'associations' do
    it { should belong_to :domain }
  end
end
