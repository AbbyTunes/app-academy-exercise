require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name, @funding, @salaries = name, funding, salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def > (startup_instance)
        self.funding > startup_instance.funding
    end

    def hire(employee_name, title)
        raise "the title is invalid" if !valid_title?(title)

        @employees << Employee.new(employee_name, title)
    end

    def size
        @employees.size
    end

    def pay_employee(employee_instance)
        payment = @salaries[employee_instance.title]
        raise "not enough funding" if self.funding < payment

        @funding -= payment
        employee_instance.pay(payment)
    end

    def payday
        @employees.each { |employee| pay_employee(employee) }
    end

    def average_salary
        num = @employees.size
        sum = 0
        @employees.each do |employee_instance|
            sum += self.salaries[employee_instance.title]
        end
        avg = sum / num.to_f
    end
    
    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup_instance)
        @funding += startup_instance.funding

        startup_instance.salaries.each do |title, salary| 
            @salaries[title] = salary if !self.valid_title?(title)
        end
        @employees += startup_instance.employees
        startup_instance.close
    end

end
