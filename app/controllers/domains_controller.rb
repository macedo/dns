class DomainsController < ApplicationController
  before_filter :find_domain, only: [ :show, :edit, :update, :destroy ]

  def index
    @domains = Domain.all
    respond_with(@domains)
  end

  def new
    @domain = Domain.new
  end

  def create
    @domain = Domain.create!(params[:domain])
    respond_with(@domain)
  end

  def edit
  end

  def update
    @domain.update_attributes!(params[:domain])
    respond_with(@domain)
  end

  def show
    respond_with(@domain)
  end

  def destroy
    @domain.destroy
    respond_with(@domain)
  end

  private
  def find_domain
    @domain = Domain.find(params[:id])
  end
end
