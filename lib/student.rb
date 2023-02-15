class Student
  attr_reader :name, :age
  attr_accessor :scores

  def initialize(details)
    @name = details[:name]
    @age = details[:age]
    @scores = []
  end

  def log_score(score)
    @scores << score
  end

  def grade
    @scores.sum.to_f / @scores.length
  end
end
