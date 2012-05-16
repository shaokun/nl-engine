class Hr::Employee < ActiveRecord::Base
  belongs_to :department
  attr_accessible :first_name, :last_name, :department_id
  
  def full_name
    [first_name, last_name].join(" ")
  end
end
