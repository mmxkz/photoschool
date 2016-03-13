class Purchase < ActiveRecord::Base
  belongs_to :promo

  accepts_nested_attributes_for :promo
end
