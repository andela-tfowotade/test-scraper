module Api
  module V1
    class MoviesController < ApplicationController
      before_action :find_movie, only: :show

      def index
        @movies = Movie.all
        render json: @movies, status: 200
      end

      def show
        render json: @movie, status: 200
      end

      private

      def find_movie
        @movie ||= Movie.find_by_id(params[:id])
      end
    end
  end
end
