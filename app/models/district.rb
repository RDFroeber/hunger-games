class District < ActiveRecord::Base
  has_many :citizens
  has_many :tributes

  validates :name, :industry, presence: true
end