require 'spec_helper'

describe Domain do
  describe 'accessible attributes' do
    it { should allow_mass_assignment_of :name }
  end

  describe 'associations' do
    it { should have_many :records }
  end
end
