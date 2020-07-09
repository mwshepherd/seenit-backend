class CountriesController < ApplicationController
    before_action :set_country, only: [:destroy]

    def index
        @countries = Country.all
        if params[:type] == "json"
            data = @countries.map do |country|
                {
                    name: country.name,
                    id: country.id,
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

    def destroy
        @country.destroy
        render json: 'country deleted', status: 200
    end

    private

    def set_country
        @country = Country.find(params[:id])
    end

    def country_params
        params.require(:country).permit(:name)
    end
end
