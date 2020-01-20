require_relative "./scraper.rb"
require_relative "./events.rb"
require 'nokogiri'


class CommandLineInterface


  def call
    create_events
    add_descpription_to_events
    list_events
    interaction
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

  end

  def interaction
    puts "Enter number of event you'd like more info on(or type list to see the list again):"
    input = nil
    while input != "exit"
      input = gets.strip.downcase
    
      case input

      when Events.all[input.to_i] != nil
        puts "#{event.description}"
      when input = "list"
        list_events
    
      end
    end
  end


end