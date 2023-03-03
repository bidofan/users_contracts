class Api::ConditionsController < ApplicationController
  def create
    @condition = Condition.new(type: params[:type], trusted: params[:trusted], company_id: params[:company_id])
    if @condition.save
      render json: @condition.as_json, status: 200
    else
      render json: { message: 'Incorrect params' }, status: 422
    end
  end

  def show
    @condition = Condition.find(params[:id])
    if @condition
      render json: @condition.as_json, status: 200
    else
      render json: { message: 'Record not found' }, status: 404
    end
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Record not found' }, status: 404
  end

  def calculate_conditions
    render json: conditions_calculation.as_json, status: 200
  end

  private

  #I would better move this logic to service, because that how it should be, but as I don't have much time I leave it here, I will refactor it later
  def conditions_calculation
    condition = {}
    condition[:trusted] = contract.supplier.spend > 50000
    condition[:type] = contract.title.include?('Contract') ? Condition.types[:contract] : Condition.types[:agreement]
    condition
  end

  def contract
    @contract ||= Contract.find(params[:contract_id])
  end
end
