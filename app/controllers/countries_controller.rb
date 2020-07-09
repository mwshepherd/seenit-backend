class CountriesController < ApplicationController
    def index
        @countries = Country.all
        if params[:type] == "json"
            data = @countries.map do |country|
                {
                    name: country.name,
                    coords: [country.latitude, country.longitude]
                }
            end 
            render json: {data: data}
        end
    end

    def show
    end
end
