class Events
  attr_accessor :name, :date, :location, :event_url, :description
  @@all = []
  def initialize(events)
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


  def self.all
    @@all
  end
end