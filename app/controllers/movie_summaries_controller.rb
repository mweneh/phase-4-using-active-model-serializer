class MovieSummariesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    def summary
        movie = Movie.find(params[:id])
        render json: movie, serializer: MovieSummarySerializer
      end
      def summaries
        movies = Movie.all
        render json: movies, each_serializer: MovieSummarySerializer
      end

      private
      def render_not_found_response
        render json: {error: 'Movie Not Found'}, staus: 404
      end
end
