require_relative "../lib/scraper.rb"
require_relative "../lib/events.rb"
require 'nokogiri'


class CommandLineInterface


  def call
    create_events
    add_descpription_to_events
    list_events

  end

  def create_events
    events = Scraper.scrape
    Events.create(events)
  end

  def add_description_to_events
    Events.all.each do |event|
      description = Scraper.scrape_description
      event.add_event_details(description)
    end
  end

  def list_events
    puts "Here are some events happening soon:"
    Events.all.each.with_index(1) do |event, x|
      puts "#{x}. #{event.name}"
      puts "  location: #{event.location}"
      puts "  date: #{event.date}"
    end
    puts "Enter number of event you'd like more info on:"
    input = gets.strip
    case input
      if Events.all[input] != nil
        event.description
      else
        puts "Sorry, thats not a valid entry"
      end
    end
  end


end