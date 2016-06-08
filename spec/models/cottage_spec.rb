require 'rails_helper'

RSpec.describe Cottage, type: :model do
  describe 'attributes' do
    it { should respond_to :name }
    it { should respond_to :color }
    it { should respond_to :sq_footage }
    it { should respond_to :price }
  end

  describe 'class_methods' do
    before(:each) do
      @cottage1 = Cottage.create(name: 'The Bungalow', color: 'yellow', sq_footage: 280, price: 12000)
      @cottage2 = Cottage.create(name: 'Prampton', color: 'purple', sq_footage: 450, price: 24780)
      @cottage3 = Cottage.create(name: 'Lampdraf', color: 'brown', sq_footage: 320, price: 17500)
      @cottage4 = Cottage.create(name: 'Kota', color: 'red', sq_footage:758, price: 24500)
    end

    it 'sorts by name' do
      cottages = Cottage.by_name
      expect(cottages).to eq([@cottage4, @cottage3, @cottage2, @cottage1])
    end

    it 'sorts by sq_footage asc' do
      cottages = Cottage.by_sqfeet
      expect(cottages).to eq([@cottage1, @cottage3, @cottage2, @cottage4])
    end

    it 'sorts by sq_footage desc' do
      cottages = Cottage.by_sqfeet(true)
      expect(cottages).to eq([@cottage4, @cottage2, @cottage3, @cottage1])
    end

    it 'sorts by price asc' do
      cottages = Cottage.by_price
      expect(cottages).to eq([@cottage1, @cottage3, @cottage2, @cottage4])
    end

    it 'sorts by price asc' do
      cottages = Cottage.by_price
      expect(cottages).to eq([@cottage4, @cottage2, @cottage3, @cottage1])
    end

  end

  describe 'instance_methods' do

  end
end
