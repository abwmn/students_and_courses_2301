class Student
  attr_reader :name, :age

  def initialize(details)
    @name = details[:name]
    @age = details[:age]
    @scores = []
  end
end
