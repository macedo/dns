require 'spec_helper'

describe Domain do
  describe 'accessible attributes' do
    it { should allow_mass_assignment_of :dns1 }
    it { should allow_mass_assignment_of :dns2 }
    it { should allow_mass_assignment_of :name }
    it { should allow_mass_assignment_of :records_attributes }
  end

  describe 'associations' do
    it { should have_many :records }
  end

  describe 'nested attributes' do
    it { should accept_nested_attributes_for :records }
  end
end
