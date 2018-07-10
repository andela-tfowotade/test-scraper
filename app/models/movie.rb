require "open-uri"

class Movie < ApplicationRecord
  def self.fetch_movies
    entries.each do |entry|
      title = MovieTitle.new(entry).format
      release_date = entry.css(".entry-date").text
      movie_link = entry.css("a").attribute("href").value
      img_link = entry.css(".entry-thumb > img").attribute("src")
      rating = entry.css(".entry-thumb > .rate").text

      create_movie(title, release_date, movie_link, img_link, rating)
    end
  end

  private

  def entries
    @entries = Nokogiri::HTML(open("https://silverbirdcinemas.com")).css(".entry-item")
  end

  def create_movie(title, release_date, movie_link, img_link, rating)
    Movie.create(
      title: title,
      release_date: release_date,
      movie_link: movie_link,
      img_link: img_link,
      rating: rating
    )
  end
end


class MovieTitle
  attr_reader :entry

  def initialize(entry)
    @entry = entry
  end

  def format
    entry.css(".entry-title").text
  end
end
