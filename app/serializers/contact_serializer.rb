class ContactSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :notes, :errors
  has_many :phone_numbers
end
