require 'spec_helper'

describe Domain do
  describe 'accessible attributes' do
    it { should allow_mass_assignment_of :name }
  end

  describe 'associations' do
    it { should have_many(:records).dependent(:destroy) }
  end

  describe 'before_create' do
    before do
      Timecop.freeze
      @domain = FactoryGirl.create(:domain)
    end

    after { Timecop.return }

    it { @domain.serial.should == Time.now.to_i }
  end
end
