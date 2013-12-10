class Game < ActiveRecord::Base
  has_many :rounds
  has_many :tributes
  has_many :escorts

  validates :president, :name, presence: true

  def start_preliminaries
    skills = ["archery", "knife-throwing", "strength", "camouflage", "snares", "speed", "fishing"]

    self.tributes.each do |trib|
      trib.skill = skill.sample
    end

    binding.pry
  end
end