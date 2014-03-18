class Api::V1::PhoneNumbersController < ApplicationController
  inherit_resources
  defaults class_name: 'Contact'
  respond_to :json
  belongs_to :contact

  def create
    super do |format|
      format.json { render json: resource }
    end
  end

  def permitted_params
    params.permit(phone_number: [])
  end
end
