module Api;module V1
  class BirdsController < ApiController
    before_action :set_bird, only: [:show, :destroy]
    def create
      @bird = Bird.new(bird_params)
      if @bird.save
        render json: @bird, status: 201
      else
        render :json => { :errors => @bird.errors.full_messages }, status: :bad_request
      end
    end

    def index
      @birds = Bird.visible
      render json: @birds
    end

    def show
      render json: @bird, status: 200
    end

    def destroy     
      @bird.destroy
      head 200    
    end

    private

    def set_bird
      @bird = Bird.find_by(id: params[:id])
      unless @bird.present?
        head 404
      end
    end

    def bird_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end  

  end
end;end 