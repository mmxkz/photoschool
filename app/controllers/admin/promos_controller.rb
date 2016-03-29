module Admin
  class PromosController < AdminController
    def new
      @types = Promo.type_sales.keys
      super
    end

    def create
      count = params['count'] ? params['count'].to_i : 1

      count.times do
        params['promo'].merge! 'code' => Promos::Builder.new().build_promocode(params['mask'])
        promo = Promo.new(resource_params)
        unless promo.save
          count -= 1
        end
      end
      respond_to do |format|
        format.json{ render json: {completed: count}.to_json }
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
