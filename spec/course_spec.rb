require './lib/course'
require './lib/student'

RSpec.describe Course do
  before(:each) do
    @course = Course.new("Calculus", 2)
  end

  it 'exists' do
    expect(@course).to be_a(Course)
  end

  it 'has a name and a capacity' do
    expect(@course.name).to eq("Calculus")
    expect(@course.capacity).to eq(2)
  end

  it 'can enroll students' do
    expect(@course.students).to eq([])

    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})   
    @course.enroll(student1)
    @course.enroll(student2)

    expect(@course.students).to eq([student1, student2])

    student3 = Student.new({name: "Lonely", age: 24})
    @course.enroll(student3)

    expect(@course.students).to eq([student1, student2])
  end

  it 'can check if full' do
    expect(@course.full?).to eq(false)

    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})   
    @course.enroll(student1)
    @course.enroll(student2)

    expect(@course.full?).to eq(true)
  end

end