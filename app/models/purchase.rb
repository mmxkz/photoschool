class Purchase < ActiveRecord::Base
  belongs_to :promo
  accepts_nested_attributes_for :promo

  after_create :increment_promo_usages, on: :create, if: :promo_id?

  def increment_promo_usages
    promo.increment!(:usages)
  end
end
