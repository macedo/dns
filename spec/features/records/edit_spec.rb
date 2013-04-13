require 'spec_helper'

describe 'Records', 'Edit' do

  let(:domain) { FactoryGirl.create(:domain) }

  it "edits A record" do
    record = FactoryGirl.create(:a_record,
      hostname: 'johndoe.com',
      ip_address: '192.168.1.1',
      domain: domain
    )

    visit domain_path(domain)

    within "#a_records #a_record_#{record.id}" do
      click_link 'Edit'
    end

    current_path.should == edit_domain_record_path(domain, record)

    fill_in 'Hostname', with: 'john.doe'
    fill_in 'Ip address', with: '200.0.0.1'
    click_button 'Update Record'

    record.reload
    record.hostname.should == 'john.doe'
    record.ip_address.should == '200.0.0.1'

    current_path.should == domain_path(domain)
    page.should have_content 'Record was successfully updated.'
  end

  it "edits NS record" do
    record = FactoryGirl.create(:ns_record,
      hostname: 'ns1.johndoe.com',
      domain: domain
    )

    visit domain_path(domain)

    within "#ns_records #ns_record_#{record.id}" do
      click_link 'Edit'
    end

    current_path.should == edit_domain_record_path(domain, record)

    fill_in 'Hostname', with: 'ns2.johndoe.com'
    click_button 'Update Record'

    record.reload
    record.hostname.should == 'ns2.johndoe.com'

    current_path.should == domain_path(domain)
    page.should have_content 'Record was successfully updated.'
  end

  it "edits CNAME record" do
    record = FactoryGirl.create(:cname_record,
      hostname: 'johndoe.com',
      subdomain: 'www',
      domain: domain
    )

    visit domain_path(domain)

    within "#cname_records #cname_record_#{record.id}" do
      click_link 'Edit'
    end

    current_path.should == edit_domain_record_path(domain, record)

    fill_in 'Subdomain', with: 'blog'
    click_button 'Update Record'

    record.reload
    record.subdomain.should == 'blog'

    current_path.should == domain_path(domain)
    page.should have_content 'Record was successfully updated.'
  end

  it "edits MX record" do
    record = FactoryGirl.create(:mx_record,
      priority: '1',
      hostname: 'johndoe.com',
      domain: domain
    )

    visit domain_path(domain)

    within "#mx_records #mx_record_#{record.id}" do
      click_link 'Edit'
    end

    current_path.should == edit_domain_record_path(domain, record)

    fill_in 'Priority', with: '10'
    click_button 'Update Record'

    record.reload
    record.priority.should == '10'

    current_path.should == domain_path(domain)
    page.should have_content 'Record was successfully updated.'
  end

  it "edits TXT record" do
    record = FactoryGirl.create(:txt_record,
      txt_name: 'johndoe.com',
      text: 'abc',
      domain: domain
    )

    visit domain_path(domain)

    within "#txt_records #txt_record_#{record.id}" do
      click_link 'Edit'
    end

    current_path.should == edit_domain_record_path(domain, record)

    fill_in 'Text', with: 'values'
    click_button 'Update Record'

    record.reload
    record.text.should == 'values'

    current_path.should == domain_path(domain)
    page.should have_content 'Record was successfully updated.'
  end

  it "edits SRV record" do
    record = FactoryGirl.create(:srv_record,
      hostname: 'johndoe.com',
      priority: '1',
      weight: '10',
      port: '80',
      target: 'www.johndoe.com',
      domain: domain
    )

    visit domain_path(domain)

    within "#srv_records #srv_record_#{record.id}" do
      click_link 'Edit'
    end

    current_path.should == edit_domain_record_path(domain, record)

    fill_in 'Priority', with: '100'
    click_button 'Update Record'

    record.reload
    record.priority.should == '100'

    current_path.should == domain_path(domain)
    page.should have_content 'Record was successfully updated.'
  end
end
