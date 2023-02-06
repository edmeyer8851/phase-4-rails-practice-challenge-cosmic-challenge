class ScientistsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def index
        scientists = Scientist.all
        render json: scientists, status: :ok
    end

    def show
        scientist = Scientist.find(params[:id])
        render json: scientist, serializer: ScientistMissionsSerializer, status: :ok
    end

    def create
        scientist = Scientist.create!(scientist_params)
        render json: scientist, status: :created
    end

    def update
        scientist = Scientist.find(params[:id])
        scientist.update(scientist_params)
        scientist.save!
        render json: scientist, status: :accepted
    end

    def destroy
        scientist = Scientist.find(params[:id])
        scientist.destroy
        head :no_content
    end

    private

    def render_not_found
        render json: { error: "Scientist not found"}, status: :not_found
    end

    def render_unprocessable_entity
        render json: { errors: ["validation errors"]}, status: :unprocessable_entity
    end

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end

end
