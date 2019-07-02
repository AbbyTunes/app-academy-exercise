class Bootcamp
    
    attr_reader :name, :slogan, :teachers, :students
  
    def initialize(name, slogan, student_capacity)
        @name, @slogan, @student_capacity = name, slogan, student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |h, k| h[k] = [] }
    end

    def hire(teacher)
        @teachers << teacher
    end

    def enroll(student)
        if @students.size < @student_capacity
            @students << student
            true
        else
            @students
            false
        end
    end

    def enrolled?(student)
        @students.include?(student)
    end

    def student_to_teacher_ratio
        @students.size / @teachers.size
    end

    def add_grade(student, grade)
        if self.enrolled?(student)
            @grades[student] << grade
            true
        else
            false
        end
    end

    def num_grades(student)
        @grades[student].size
    end

    def average_grade(student)
        if !enrolled?(student) || @grades[student].empty?
            nil
        else
            @grades[student].sum / self.num_grades(student)
        end
    end

end
