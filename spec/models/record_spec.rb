require 'spec_helper'

describe Record do

  describe 'accessible attributes' do
    it { should allow_mass_assignment_of :values }
    it { should allow_mass_assignment_of :domain }
  end

  describe 'associations' do
    it { should belong_to :domain }
  end

  describe 'callbacks' do
    before(:all) { @domain = FactoryGirl.create(:domain) }

    describe 'after_save' do
      it "should increment @domain serial number" do
        expect {
          FactoryGirl.create(:a_record, domain: @domain)
        }.to change(@domain, :serial).by(1)
      end

      it "should increment @domain serial number after update too" do
        @record = FactoryGirl.create(:a_record, domain: @domain)
        expect {
          @record.update_attribute(:hostname, 'johndoe.me')
        }.to change(@domain, :serial).by(1)
      end
    end

    describe 'after_destroy' do
      it "should increment @domain serial number" do
        @record = FactoryGirl.create(:a_record, domain: @domain)
        expect {
          @record.destroy
        }.to change(@domain, :serial).by(1)
      end
    end
  end
end
