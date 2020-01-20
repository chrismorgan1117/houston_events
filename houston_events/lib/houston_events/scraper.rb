require 'open-uri'

class Scraper

  def self.scrape
    doc = Nokogiri::HTML(open('https://www.visithoustontexas.com/events'))
    events = []
    doc.css("div. contents shared-item-container shared-items grid").each do |card|
      card.css("div.info contents").each do |event|
        event_link = "#{event.attr('href')}"
        event_location = event.css('p.address').text
        event_name = event.css('a.title truncate').text
        event_date = event.css('span.mini-date-container').text
        events << {name: event_name, location: event_location, event_url: event_link, date: event_date}
      end
    end
    events
  end

  def self.scrape_description
    event = {}
    doc = Nokogiri::HTML(open('https://www.visithoustontexas.com/events/' + event_url))
    description = doc.css("li.active p").text
    description. each do |descript|
      event[:description] = descript
    end
  end


end