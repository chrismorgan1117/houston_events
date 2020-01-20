require 'open-uri'

class Scraper

  def self.scrape
    doc = Nokogiri::HTML(open('https://www.visithoustontexas.com/events'))
    events = []
    doc.css("div.contents shared-item-container shared-items grid").each do |card|
      card.css("div.info contents").each do |event|
        event_link = "#{event.attr('href')}"
        event_location = event.css('p.address').text
        event_name = event.css('h4').text
        events << {name: event_name, location: event_location, event_url: event_link}
      end
    end
    events
  end

  def self.scrape_description
    @event_url = event_url
    event = {}
    doc = Nokogiri::HTML(open('https://www.visithoustontexas.com/events/' + event_url))
    description = doc.css("li.active p").text
    description. each do |descript|
      event[:description] = descript
    end
    event
  end


end