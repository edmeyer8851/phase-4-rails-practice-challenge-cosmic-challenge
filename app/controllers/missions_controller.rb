class MissionsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def create
        mission = Mission.create!(mission_params)
        render json: mission.planet, status: :created
    end

    private

    def render_unprocessable_entity
        render json: { errors: ["validation errors"]}, status: :unprocessable_entity
    end

    def mission_params
        params.permit(:name, :scientist_id, :planet_id)
    end
end
