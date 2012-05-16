class Hr::DepartmentsController < ApplicationController
  def index
    @departments = Department.all
  end
  
  def new
    @department = Department.new
  end
  
  def create
    @department = Department.new(params[:department])
    if @department.save
      redirect_to departments_path
    end
  end
end
