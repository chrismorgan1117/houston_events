class Events
  attr_accessor :name, :date, :location, :event_url, :description
  @@all = []
  def initialize(events, name)
    @name = name
    events.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    @@all << self
  end

  def self.create(events)
    events.each do |event|
      Events.new(event)
    end
  end

  def add_event_details(details)
    details.each do |attr, value|
      self.send("#{attr}=", value)
    end
    self
  end

  
  def self.print_all
    all.each_with_index do |event, index|
      puts "#{index+1}.     #{event.name}"
    end
  end

  def self.all
    @@all
  end
end