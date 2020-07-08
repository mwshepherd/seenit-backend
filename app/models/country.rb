class Country < ApplicationRecord
    has_many :cities
    geocoded_by :name
    after_validation :geocode
end
