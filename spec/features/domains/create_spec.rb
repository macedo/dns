require 'spec_helper'

describe 'Domains', 'Create' do

  it "adds a new domain" do
    visit domains_path
    expect {
      click_link 'New Domain'

      fill_in 'Name', with: 'johndoe.com'
      click_button 'Create Domain'
    }.to change(Domain, :count).by(1)

    page.should have_content 'Domain was successfully created.'
    within 'h1' do
      page.should have_content 'johndoe.com'
    end
    current_path.should == domain_path(Domain.last)
  end
end
