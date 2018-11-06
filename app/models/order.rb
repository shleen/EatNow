class Order < ApplicationRecord
  include Friendlyable

  belongs_to :user
end
