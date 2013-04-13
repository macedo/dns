require 'spec_helper'

describe 'Domains', 'Destroy' do

  it "deletes a domain" do
    domain = FactoryGirl.create(:domain)
    visit domains_path

    expect {
      within "#domain_#{domain.id}" do
        click_link 'Destroy'
      end
    }.to change(Domain, :count).by(-1)

    current_path.should == domains_path
    page.should  have_content 'Domain was successfully destroyed.'
  end
end
