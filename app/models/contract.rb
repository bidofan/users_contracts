class Contract < ApplicationRecord
  has_one :condition
  belongs_to :user
  belongs_to :supplier
end

