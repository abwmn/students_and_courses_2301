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
end