require 'spec_helper'

describe DomainsController do
  describe 'GET #index' do
    it 'assign all domains' do
      domain = FactoryGirl.create(:domain)
      get :index
      assigns(:domains).should eq ([domain])
    end

    it 'renders index view' do
      get :index
      response.should render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'assign new domain' do
      get :new
      assigns(:domain).should be_instance_of Domain
    end

    it 'assign 1 new record to the new domain' do
      get :new
      assigns(:domain).records.size.should equal 1
      assigns(:domain).records[0].should be_instance_of Record
    end

    it 'renders new view' do
      get :new
      response.should render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new domain' do
        expect {
          post :create, domain: FactoryGirl.attributes_for(:domain)
        }.to change(Domain, :count).by(1)
      end

      it 'redirects to the domain show page' do
        post :create, domain: FactoryGirl.attributes_for(:domain)
        response.should redirect_to Domain.last
      end
    end

    context 'with invalid attributes' do
      pending('without validations')
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested domain to @domain' do
      domain = FactoryGirl.create(:domain)
      get :edit, id: domain
      assigns(:domain).should eq domain
    end

    it 'renders the domain edit page' do
      get :edit, id: FactoryGirl.create(:domain)
      response.should render_template :edit
    end
  end

  describe 'PUT #update' do
    before { @domain = FactoryGirl.create(:domain) }

    context 'with valid attributes' do
      it 'locate the requested @domain' do
        put :update, id: @domain, domain: FactoryGirl.attributes_for(:domain)
        assigns(:domain).should eq(@domain)
      end

      it 'changes @domain attributes' do
        put :update, id: @domain, domain: FactoryGirl.attributes_for(:domain, name: 'rafaelmacedo.com')
        @domain.reload
        @domain.name.should eq('rafaelmacedo.com')
      end

      it 'redirects the office edit page' do
        put :update, id: @domain, domain: FactoryGirl.attributes_for(:domain)
        response.should redirect_to @domain
      end
    end

    context 'with invalid attributes' do
      pending('without validations')
    end
  end

  describe "GET #show" do
    it "assigns the requested domain to @domain" do
      domain = FactoryGirl.create(:domain)
      get :show, id: domain
      assigns(:domain).should eq(domain)
    end

    it "renders the #show view" do
      get :show, id: FactoryGirl.create(:domain)
      response.should render_template :show
    end
  end

  describe 'DELETE #destroy' do
    before { @domain = FactoryGirl.create(:domain) }

    it "deletes the domain" do
      expect{
        delete :destroy, id: @domain
      }.to change(Domain,:count).by(-1)
    end

    it "redirects to domain#index" do
      delete :destroy, id: @domain
      response.should redirect_to domains_url
    end
  end
end
