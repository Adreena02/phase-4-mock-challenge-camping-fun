class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    def create
        signup = Signup.create!(signup_params)
        render json: signup.activity, status :created
    end

    private

    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end

    def render_unprocessable_entity_response(exeception)
        render json: { errors: exeception.record.errors.full_messages }, status: :unprocessable_entity
    end
end
