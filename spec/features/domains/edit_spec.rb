require 'spec_helper'

describe 'Domains', 'Edit' do

  it "edits a domain" do
    domain = FactoryGirl.create(:domain, name: 'rafaelmacedo.com.br')
    visit domains_path

    within "#domain_#{domain.id}" do
      click_link 'Edit'
    end

    current_path.should == edit_domain_path(domain)
    fill_in 'Name', with: 'rafaelmacedo.com'
    click_button 'Update Domain'

    domain.reload
    domain.name.should == 'rafaelmacedo.com'

    current_path.should == domain_path(domain)
    page.should have_content 'Domain was successfully updated.'
  end
end
