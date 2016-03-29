class Purchase < ActiveRecord::Base
  belongs_to :promo
  accepts_nested_attributes_for :promo

  after_commit :increment_promo_usages, if: :promo_id?

  def increment_promo_usages
    promo.increment!(:usages)
  end
end
