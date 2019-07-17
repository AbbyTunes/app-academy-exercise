class Course < ApplicationRecord

    has_many :enrollments,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Enrollment

    has_many :enrolled_students,
    through: :enrollments,
    source: :user

    belongs_to :prerequisite,
    class_name: "Course",
    primary_key: :id, 
    foreign_key: :prereq_id,
    optional: true

    has_many :following_course,
    class_name: :Course,
    primary_key: :id, 
    foreign_key: :prereq_id
    # optional: true # CANNOT have optional here

    belongs_to :instructor,
    primary_key: :id,
    foreign_key: :instructor_id,
    class_name: :User

end
