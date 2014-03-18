class Api::V1::ContactsController < ApplicationController
  respond_to :json

  def index
    respond_with Contact.all
  end

  def show
    respond_with Contact.find(params[:id])
  end

  def create
    contact = Contact.create(permitted_params)

    if contact.valid?
      render json: contact
    else
      render json: { errors: contact.errors }, status: :unprocessable_entity
    end
  end

  def update
    contact = Contact.find(params[:id])

    if contact.update(permitted_params)
      render json: nil
    else
      render json: { errors: contact.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    respond_with Contact.find(params[:id]).destroy
  end

  private

  def permitted_params
    params.require(:contact).permit(:first_name, :last_name, :email, :notes)
  end
end
