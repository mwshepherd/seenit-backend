class CountriesController < ApplicationController
    before_action :set_country, only: [:destroy]
    before_action :authenticate_user

    def index
        @countries = current_user.countries.all
        if params[:type] == "json"
            data = @countries.map do |country|
                {
                    name: country.name,
                    id: country.id,
                    coords: [country.latitude, country.longitude]
                }
            end 
            render json: {
                user: {
                    username: current_user.username,
                    email: current_user.email
                }, 
                data: data
            }
        end
    end

    def create
        current_user.countries.create(country_params)
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
