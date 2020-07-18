require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    index_page = Nokogiri::HTML(open(index_url))
    students = []
    index_page.css("div.roster-cards-container").each do |card|
      student_url = card.css(".student-card").text
      card.css(".card-text-container").each do |container|
        student_name = container.css(".student-name").text
        student_location = container.css(".student-location").text
        students << {name: student_name, location: student_location, profile_url: student_url}
      end
    end
    students
  end

  def self.scrape_profile_page(profile_url)
    
  end

end
 

