class Meetup
  WEEKDAYS = { 'sunday' => 0,
               'monday' => 1,
               'tuesday' => 2,
               'wednesday' => 3,
               'thursday' => 4,
               'friday' => 5,
               'saturday' => 6 }

  SCHEDULE = { 'first' => 1,
               'second' => 2,
               'third' => 3,
               'fourth' => 4,
               'fifth' => 5 }

  attr_accessor :month

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, schedule)
    current = Date.new(@year, @month, 1)
    case schedule
    when 'last' then last_day(current, weekday)
    when 'teenth' then teenth_day(weekday)
    else generic_day(current, weekday, schedule)
    end
  end

  def generic_day(current, weekday, schedule)
    counter = 0
    while counter < SCHEDULE[schedule.downcase]
      if current.wday == WEEKDAYS[weekday.downcase]
        counter += 1
        current = current.next unless counter == SCHEDULE[schedule.downcase]
      else
        current = current.next
      end
    end
    @month == current.mon ? current : nil
  end

  def last_day(current, weekday)
    loop do
      break if current.wday == WEEKDAYS[weekday.downcase]
      current = current.next
    end
    correct_weekday = current
    while correct_weekday.mon == @month
      correct_weekday = correct_weekday.next_day(7)
    end
    correct_weekday.prev_day(7)
  end

  def teenth_day(weekday)
    current = Date.new(@year, @month, 13)
    loop do
      break if current.wday == WEEKDAYS[weekday.downcase]
      current = current.next
    end
    current
  end
end
