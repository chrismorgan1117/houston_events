require_relative "./scraper.rb"
require_relative "./events.rb"
require 'nokogiri'


class CommandLineInterface


  def call
    create_events
    add_description_to_events
    list_events
    interaction
    goodbye
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
    #@events = []
    #Events.all.each do |event|
    #  @events << event
    #end
    puts "Here are some events happening soon:"
    #@events.each_with_index do |event, x|
    #  puts "#{x}. #{event.name}"
    #  puts "  location: #{event.location}"
    #  puts "  date: #{event.date}"
    #end
    Events.print_all
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

  def goodbye
    puts "Have a nice day!"
  end
end