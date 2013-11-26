class District < ActiveRecord::Base
  validates :name, :industry, presence: true

end