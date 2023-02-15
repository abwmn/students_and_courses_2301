require './lib/student.rb'

RSpec.describe Student do
  it 'exists' do
    expect(Student.new).to be_a(Student)
  end
end