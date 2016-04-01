class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def new(&block)
    @resource ||= resources_class.new
  end

  def create
    @resource ||= resources_class.new(resource_params)
    if @resource.save
      respond_to do |format|
        format.json{ render json: {status: 200}.to_json }
      end
    else
      @errors = @resource.errors.messages
      new
    end
  end

  def index
    @resources = resources_class.all
  end

  def resources_class
    controller_name.classify.constantize
  end

  def resource_params(*permits)
    params
      .require(resources_class.model_name.singular)
      .permit(*permits)
  end
end
