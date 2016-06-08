class City < ActiveRecord::Base
  RATINGS = [1,2,3,4,5]
  has_many :cottages, dependent: :destroy
  validates_presence_of :name

  def self.by_name
    order(:name)
  end

  def self.by_year_est
    order(:year_est)
  end

  def self.by_population
    order(:population)
  end

  def self.by_schools_rank(low = false)
    if low
    order(schools_rank: :desc)
    else
      order(:schools_rank)
    end
  end

  def self.ratings
    RATINGS
  end
end
