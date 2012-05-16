class Hr::EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end
  
  def new
    @employee = Employee.new
  end
  
  def create
    @employee = Employee.new(params[:employee])
    if @employee.save
      redirect_to employees_path
    end
  end
end
