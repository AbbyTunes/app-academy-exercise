class Employee

    attr_reader :salary
    attr_accessor :boss, :employees

    def initialize(name, title, salary, boss)
        @name, @title, @salary, @boss = name, title, salary, boss
        @employees = []
        @boss.employees << self unless @boss.employees.include?(self)
    end


    def bonus(multiplier)
        bonus = @salary * multiplier
    end
    
end

class Manager < Employee
    
    attr_reader :salary
    attr_accessor :boss, :employees
    
    # def initialize(name, title, salary, boss)

    # end

    def bonus(multiplier)
        sum_salary = self.employees.inject {|sum, employee| sum + employee.salary }
        p @employees
        bonus = sum_salary * multiplier
    end
end


if $PROGRAM_NAME == __FILE__ 
  ned = Manager.new('Ned','Founder', 1000000, nil)
  darren = Manager.new('Darren', 'TA Manager', 78000, ned)
  shawna = Employee.new('Shawna', 'TA', 12000, darren)
  david	= Employee.new('David', 'TA', 10000, darren)


  p ned.bonus(5) # => 500_000
  p darren.bonus(4) # => 88_000
  p david.bonus(3) # => 30_000
end