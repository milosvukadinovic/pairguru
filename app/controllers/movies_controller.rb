require 'httparty'
require 'uri'
require "open-uri"
require "json"

class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:send_info, :export]

  expose_decorated(:movies) { Movie.all.includes(:genre) }
  expose_decorated(:movie)
  
  def index
    @movies = Movie.all.decorate
  end

  def show
    @movie = Movie.find(params[:id])
  end
 
  def send_info
    @movie = Movie.find(params[:id])
    MovieInfoMailer.send_info(current_user, @movie).deliver_later
    redirect_back(fallback_location: root_path,
                  notice: "Email sent with movie info")
  end

  def export
    MovieCsvExporterJob.perform_later(current_user.id)
    redirect_back(fallback_location: root_path,
                  notice: "Movies exported")
  end
end
