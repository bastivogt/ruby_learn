class Event
  def initialize(type, sender)
    @type = type
    @sender = sender
  end

  attr_reader :type, :sender
end