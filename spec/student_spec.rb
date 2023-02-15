require './lib/student'

RSpec.describe Student do
  before(:each) do
    @student = Student.new({name: "Morgan", age: 21})
  end

  it 'exists' do
    expect(@student).to be_a(Student)
  end

  it 'has a name' do
    expect(@student.name).to eq("Morgan")
  end

  it 'has an age' do
    expect(@student.age).to eq(21)
  end

  it 'can store scores' do
    expect(@student.scores).to eq([])

    @student.log_score(89)
    @student.log_score(78)
    
    expect(@student.scores).to eq([89, 78])
  end

  it 'averages scores into grade' do
    @student.log_score(89)
    @student.log_score(78)
    expect(@student.grade).to eq(83.5)
  end
end