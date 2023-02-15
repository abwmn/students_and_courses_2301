require './lib/student'
require './lib/course'
require './lib/gradebook'

RSpec.describe Gradebook do
  before(:each) do
    @gradebook = Gradebook.new("Mod Squad")
  end

  it 'exists' do
    expect(@gradebook).to be_a(Gradebook)
  end

  it 'has an instructor' do
    expect(@gradebook.instructor).to eq("Mod Squad")
  end

  it 'can add courses' do
    expect(@gradebook.courses).to eq([])

    course1 = Course.new("Calculus", 2)
    course2 = Course.new("Ruby", 3)
    @gradebook.add_course(course1)
    @gradebook.add_course(course2)

    expect(@gradebook.courses).to eq([course1, course2])
  end

  it 'can list all students in its courses' do
    expect(@gradebook.list_all_students).to eq({})

    course1 = Course.new("Calculus", 2)
    course2 = Course.new("Ruby", 3)
    @gradebook.add_course(course1)
    @gradebook.add_course(course2)

    expect(@gradebook.list_all_students).to eq({course1=>[], course2=>[]})

    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})  
    student3 = Student.new({name: "Michael", age: 23})
    course1.enroll(student1)
    course1.enroll(student2)
    course2.enroll(student3)
  
    expect(@gradebook.list_all_students).to eq(course1=>[student1, student2], course2=>[student3])
  end

  it 'can check students grades against threshold' do
    course1 = Course.new("Calculus", 2)
    course2 = Course.new("Ruby", 3)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})  
    student3 = Student.new({name: "Michael", age: 23})
    course1.enroll(student1)
    course1.enroll(student2)
    course2.enroll(student3)
    @gradebook.add_course(course1)
    @gradebook.add_course(course2)

    student1.log_score(30)
    student1.log_score(40)
    student2.log_score(70)
    student2.log_score(80)
    student3.log_score(80)
    student3.log_score(90)

    expect(@gradebook.students_below(75)).to eq([student1])
    expect(@gradebook.students_below(80)).to eq([student1, student2])
    expect(@gradebook.students_below(100)).to eq([student1, student2, student3])
  end
end