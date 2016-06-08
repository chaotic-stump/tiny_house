class Cottage < ActiveRecord::Base

  belongs_to :city
  validates_presence_of :name, :color, :sq_footage, :price

  def self.by_name
    order(:name)
  end

  def self.by_color
    order(:color)
  end

  def self.by_sqfeet(high = false)
    if high
      order(sq_footage: :desc)
    else
      order(:sq_footage)
    end
  end

  def self.by_price(high = false)
    if high
      order(price: :desc)
    else
      order(:price)
    end
  end
end
