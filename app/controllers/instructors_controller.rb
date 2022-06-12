class InstructorsController < ApplicationController

    def index 
        render json: Instructor.all
    end

    def create 
        instructor = Instructor.create!(instructor_params)
        render json: instructor, status: :created
    end

    def destroy 
        instructor = find_instructor 
        instructor.destroy
        head :no_content
    end

    def update
        instructor = find_instructor 
        instructor.update!(instructor_params)
        render json: instructor, status: 200
    end

    private 

    def instructor_params
        params.permit(:name)
    end

    def find_instructor 
        Instructor.find(params[:id])
    end
end
