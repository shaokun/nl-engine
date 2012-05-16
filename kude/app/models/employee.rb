class Employee < Hr::Employee
  def full_name
    [last_name, first_name].join
  end
end