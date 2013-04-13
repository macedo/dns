require 'spec_helper'

describe 'Records', 'Create' do

  let(:domain) { FactoryGirl.create(:domain) }

  it "adds a new A record to domain" do
    visit domain_path(domain)

    expect {
      click_link 'Add a new A Record'

      fill_in 'Hostname', with: 'johndoe.com'
      fill_in 'Ip address', with: '192.168.1.1'
      click_button 'Create Record'
    }.to change(Record::A, :count).by(1)

    page.should have_content 'Record was successfully created.'
    current_path.should == domain_path(domain)
  end

  it "adds a new NS record to domain" do
    visit domain_path(domain)

    expect {
      click_link 'Add a new NS Record'

      fill_in 'Hostname', with: 'johndoe.com'
      click_button 'Create Record'
    }.to change(Record::NS, :count).by(1)

    page.should have_content 'Record was successfully created.'
    current_path.should == domain_path(domain)
  end

  it "adds a new CNAME record to domain" do
    visit domain_path(domain)

    expect {
      click_link 'Add a new CNAME Record'

      fill_in 'Hostname', with: 'johndoe.com'
      fill_in 'Subdomain', with: 'www.'
      click_button 'Create Record'
    }.to change(Record::CNAME, :count).by(1)

    page.should have_content 'Record was successfully created.'
    current_path.should == domain_path(domain)
  end

  it "adds a new MX record to domain" do
    visit domain_path(domain)

    expect {
      click_link 'Add a new MX Record'

      fill_in 'Priority', with: '1'
      fill_in 'Hostname', with: 'johndoe.com'
      click_button 'Create Record'
    }.to change(Record::MX, :count).by(1)

    page.should have_content 'Record was successfully created.'
    current_path.should == domain_path(domain)
  end

  it "adds a new TXT record to domain" do
    visit domain_path(domain)

    expect {
      click_link 'Add a new TXT Record'

      fill_in 'Txt name', with: 'johndoe.com'
      fill_in 'Text', with: 'v=spf1 a mx ip4:127.0.0.1 mx:mail.andretiengo.me -all'
      click_button 'Create Record'
    }.to change(Record::TXT, :count).by(1)

    page.should have_content 'Record was successfully created.'
    current_path.should == domain_path(domain)
  end

  it "adds a new SRV record to domain" do
    visit domain_path(domain)

    expect {
      click_link 'Add a new SRV Record'

      fill_in 'Hostname', with: 'johndoe.com'
      fill_in 'Priority', with: '10'
      fill_in 'Weight', with: '10'
      fill_in 'Port', with: '80'
      fill_in 'Target', with: 'johndoedoe.com'
      click_button 'Create Record'
    }.to change(Record::SRV, :count).by(1)

    page.should have_content 'Record was successfully created.'
    current_path.should == domain_path(domain)
  end
end
