class Message

  include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :message
  
  validates :message, presence: true
end
