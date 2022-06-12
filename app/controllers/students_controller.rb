class StudentsController < ApplicationController

    def index 
        render json: Student.all, include: :instructor, status: :ok
    end

    def create 
        student = Student.create!(student_params)
        render json: student, status: :created
    end

    def update 
        student = find_student
        student.update!(student_params)
        render json: student, status: :ok 
    end

    def destroy 
        student = find_student
        student.destroy 
        head :no_content
    end

    private 
    
    def student_params 
        params.permit(:name, :age, :major, :instructor_id)
    end

    def find_student 
        student = Student.find(params[:id])
    end

end
