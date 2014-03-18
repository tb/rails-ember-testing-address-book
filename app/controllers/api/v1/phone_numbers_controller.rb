class Api::V1::PhoneNumbersController < ApplicationController
  respond_to :json

  def permitted_params
    params.permit(phone_number: [])
  end
end
