require 'spec_helper'

describe 'Records', 'Destroy' do

  before :all do
    @domain = FactoryGirl.create(:domain)
    @a_record = FactoryGirl.create(:a_record, domain: @domain)
    @ns_record = FactoryGirl.create(:ns_record, domain: @domain)
    @cname_record = FactoryGirl.create(:cname_record, domain: @domain)
    @mx_record = FactoryGirl.create(:mx_record, domain: @domain)
    @txt_record = FactoryGirl.create(:txt_record, domain: @domain)
    @srv_record = FactoryGirl.create(:srv_record, domain: @domain)
  end

  before { visit domain_path(@domain) }

  it "deletes A Record" do
    expect {
      within "#a_record_#{@a_record.id}" do
        click_link 'Destroy'
      end
    }.to change(@domain.records, :size).by(-1)

    current_path.should == domain_path(@domain)
    page.should_not have_selector "#a_record_#{@a_record.id}"
    page.should have_content 'Record was successfully destroyed.'
  end

  it "deletes NS Record" do
    expect {
      within "#ns_record_#{@ns_record.id}" do
        click_link 'Destroy'
      end
    }.to change(@domain.records, :size).by(-1)

    current_path.should == domain_path(@domain)
    page.should_not have_selector "#ns_record_#{@ns_record.id}"
    page.should have_content 'Record was successfully destroyed.'
  end

  it "deletes CNAME Record" do
    expect {
      within "#cname_record_#{@cname_record.id}" do
        click_link 'Destroy'
      end
    }.to change(@domain.records, :size).by(-1)

    current_path.should == domain_path(@domain)
    page.should_not have_selector "#cname_record_#{@cname_record.id}"
    page.should have_content 'Record was successfully destroyed.'
  end

  it "deletes MX Record" do
    expect {
      within "#mx_record_#{@mx_record.id}" do
        click_link 'Destroy'
      end
    }.to change(@domain.records, :size).by(-1)

    current_path.should == domain_path(@domain)
    page.should_not have_selector "#mx_record_#{@mx_record.id}"
    page.should have_content 'Record was successfully destroyed.'
  end

  it "deletes TXT Record" do
    expect {
      within "#txt_record_#{@txt_record.id}" do
        click_link 'Destroy'
      end
    }.to change(@domain.records, :size).by(-1)

    current_path.should == domain_path(@domain)
    page.should_not have_selector "#txt_record_#{@txt_record.id}"
    page.should have_content 'Record was successfully destroyed.'
  end

  it "deletes SRV Record" do
    expect {
      within "#srv_record_#{@srv_record.id}" do
        click_link 'Destroy'
      end
    }.to change(@domain.records, :size).by(-1)

    current_path.should == domain_path(@domain)
    page.should_not have_selector "#srv_record_#{@srv_record.id}"
    page.should have_content 'Record was successfully destroyed.'
  end
end
