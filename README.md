This project rocks and uses MIT-LICENSE.

How to create a Namespace Less Engine
-------------------------------------

Imagine that we have HR system that could be reused in different companies' projects.

    $ rails plugin new hr --full
    $ rails g resource hr/department name
    $ rails g resource hr/employee first_name last_name department:references
    $ rake db:migrate

Comment out the `table_name_prefix` in `/app/models/hr.rb`. Because I don't want my table names to end up being like `hr_departments`, `hr_employees`.

    module Hr
      def self.table_name_prefix
        # 'hr_'
      end
    end

Do the same things for routes, so that the urls aren't scoped under `/hr`.

    Rails.application.routes.draw do
      resources :employees
      resources :departments
    end

Add placeholder models & controllers, so that we could write code without Namespace. And this also makes sure that we could define a Department, which inherits Hr::Department in our project, to override the default behavior.

    class DepartmentsController < Hr::DepartmentsController
    end

    class EmployeesController < Hr::EmployeesController
    end

    class Department < Hr::Department
    end
    
    class Employee < Hr::Employee
    end

Add a default behavior to Department

    class Hr::Employee < ActiveRecord::Base
      def full_name
        [first_name, last_name].join(" ")
      end
    end

To test the Engine in the Dummy project.

    $ cd test/dummy/
    $ rails s

Reuse Hr Engine for Kude company
--------------------------------

Create a new project, Kude:

    $ rails new kude

In the Gemfile of Kude:

    gem 'hr', :path => "../hr"
    # change to the path to the hr engine
    bundle
    # to install the engine

    $ rake hr_engine:install:migrations
    $ rake db:migrate
    $ rails s

An example to override the Hr::Employee, to make the full_name return in Chinese style.
Note that you should define this in your project.

    class Employee < Hr::Employee
      def full_name
        [last_name, first_name].join("")
      end
    end
    
    # test it out
    rails c
    Hr::Employee.new(first_name: "少坤", last_name: "伍").full_name
    =>
    少坤 伍
    
    Employee.new(first_name: "少坤", last_name: "伍").full_name
    =>
    伍少坤