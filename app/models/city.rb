class City < ApplicationRecord
    belongs_to :country
    geocoded_by :name
    after_validation :geocode
end
