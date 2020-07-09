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

    def create
        puts params[:country]
        Country.create(country_params)
        render json: "country bookmark", status: 200
    end

    private

    def country_params
        params.require(:country).permit(:name)
    end
end
