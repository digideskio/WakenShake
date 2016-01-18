class Charge < ActiveRecord::Base
  belongs_to :charged, polymorphic: true
end
