class PromosController < ApplicationController
  def find_by_code
    promo = Promo.find_by(code: params[:promocode])
    #FIXME: Добавить проверку на доступность

    if promo
      respond_to do |format|
        format.json{ render json: {id: promo.id, type_sale: promo.type_sale, sale: promo.sale}.to_json }
      end
    else
      respond_to do |format|
        format.json{ render status: 404, json: {error: 'Промокод не найден'}.to_json }
      end
    end
  end
end
