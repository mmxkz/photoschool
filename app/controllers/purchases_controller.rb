class PurchasesController < ApplicationController
  def resource_params
      super :price,
            :ip,
            :description,
            :promo_id
  end
end
