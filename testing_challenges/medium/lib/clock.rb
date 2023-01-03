class Clock
  attr_reader :time

  def initialize(time)
    @time = time
  end

  def self.at(hours, minutes=0)
    @@hours = hours
    @@minutes = minutes
    time = (hours * 100) + minutes

    Clock.new(time)
  end

  def to_s
    digits = @time.digits.reverse
    p digits
    if digits.length < 3
      format("00:%d%d", digits[0], digits[1])
    elsif digits.length < 4
      format("0%d:%d%d", digits[0], digits[1], digits[2])
    else
      format("%d%d:%d%d", digits[0], digits[1], digits[2], digits[3])
    end
  end

  def +(minutes)
    total_minutes = minutes
    total_minutes += @@minutes
    time_hour = (@time - @@minutes) / 100
    hours, minutes = total_minutes.divmod(60)
    while hours > 0
      time_hour += 1
      hours -= 1
      time_hour = 0 if time_hour == 24
    end
    time_hour = (time_hour * 100) + minutes
    Clock.new(time_hour)
  end

  def -(minutes)
    total_minutes = -minutes
    total_minutes += @@minutes
    time_hour = (@time - @@minutes) / 100
    time_hour = 24 if time_hour <= 0
    hours, mins = total_minutes.divmod(60)
    while hours > 0
      time_hour -= 1
      hours -= 1
      time_hour = 23 if time_hour == -1
    end
    new_hour, new_mins = ((time_hour * 60) + (total_minutes)).divmod(60)
    time_hour = [new_hour, new_mins].join.to_i
    Clock.new(time_hour)
  end

  def ==(other_clock)
    @time == other_clock.time
  end
end
