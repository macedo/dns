class RecordsController < ApplicationController
  before_filter :find_domain
  before_filter :find_record, only: [ :destroy ]

  def new
    @record = record.new(domain: @domain)
    respond_with(@record)
  end

  def create
    @record = record.create(params[:record].merge(domain: @domain))
    respond_with(@record, location: domain_path(@domain))
  end

  def destroy
    @record.destroy
    respond_with(@record, location: domain_path(@domain))
  end

  private
  def find_domain
    @domain = Domain.find(params[:domain_id])
  end

  def find_record
    @record = @domain.records.find(params[:id])
  end

  def record
    eval("Record::#{params[:record_name]}")
  end
end
