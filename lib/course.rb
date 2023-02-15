class Course
attr_reader :name, :capacity

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @students = []
  end

  def full?
    
  end

end
