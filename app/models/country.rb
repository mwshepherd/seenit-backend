class Country < ApplicationRecord
    belongs_to :user
    has_many :cities
    geocoded_by :name
    after_validation :geocode
end
