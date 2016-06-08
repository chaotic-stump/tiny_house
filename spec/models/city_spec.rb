require 'rails_helper'

RSpec.describe City, type: :model do

  describe 'attributes' do
    it { should respond_to :name }
    it { should respond_to :year_est }
    it { should respond_to :population }
    it { should respond_to :schools_rank }
  end

  describe 'class_methods' do
    before(:each) do
      @city1 = City.create(name: 'Merling', year_est: '1851', population: 1500, schools_rank: 2)
      @city2 = City.create(name: 'Nashville', year_est: '1816', population: 150000, schools_rank: 4)
      @city3 = City.create(name: 'Jamestown', year_est: '1601', population: 70000, schools_rank: 1)
      @city4 = City.create(name: 'Gelding', year_est: '1923', population: 27000, schools_rank: 5)
    end

    it 'sorts by name' do
      cities = City.by_name
      expect(cities).to eq([@city4, @city3, @city1, @city2])
    end

    it 'sorts by year est' do
      cities = City.by_year_est
      expect(cities).to eq([@city3, @city2, @city1, @city4])
    end

    it 'sorts by population' do
      cities = City.by_population
      expect(cities).to eq([@city1, @city4, @city3, @city2])
    end

    it 'sorts by schools rank asc' do
      cities = City.by_schools_rank
      expect(cities).to eq([@city4, @city2, @city1, @city3])
    end

    it 'sorts by schools rank desc' do
      cities = City.by_schools_rank(true)
      expect(cities).to eq([@city4, @city2, @city1, @city3])
    end
  end

  describe 'instance_methods' do

  end
end
