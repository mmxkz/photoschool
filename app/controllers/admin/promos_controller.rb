module Admin
  class PromosController < AdminController
    def new
      @types = Promo.type_sales.keys
      super
    end

    def create
      promocodes = Promos::Builder.new().build_promocodes(params['mask'], params['count'].to_i)
      promocodes.each do |promocode|
        params['promo'].merge! 'code' => promocode
        promo = Promo.new(resource_params)
        promo.save
      end

      respond_to do |format|
        format.json{ render json: {completed: promocodes.length}.to_json }
      end
    end

    def resource_params
      super :code,
            :limit,
            :sale,
            :type_sale
  end
  end
end
