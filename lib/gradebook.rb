class Gradebook
  attr_reader :instructor, :courses

  def initialize(instructor)
    @instructor = instructor
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def list_all_students
    all_students = {}
    @courses.each do |course|
      all_students[course] = course.students
    end
    all_students
  end

  def students_below(threshold)
    students_below = []
    list_all_students.values.each do |course|
      course.each do |student|
        if student.grade < threshold
          students_below << student
        end
      end
    end
    students_below
  end

  # def list_all_grades
  #   all_grades = {}
  #   @courses.each do |course|
  #     all_grades[course] = []
  #     course.students.each do |student|
  #       student.scores.each do |score|
  #         all_grades[course] << score
  #       end
  #     end
  #   end
  # end
end
