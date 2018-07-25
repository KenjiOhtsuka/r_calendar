require 'date'
begin
  require 'action_view'
  require 'active_support'
rescue LoadError
rescue 
end
require "r_calendar/version"

module RCalendar
  def self.calendar(year, month = nil)
    if month.nil?
      c = []
      (1..12).each do |m|
        c << month_calendar(year, m)
      end
      return c
    end
    return month_calendar year, month
  end

  def self.month_calendar(year, month)
    begin_day = Date.new(year, month, 1)
    begin_weekday = begin_day.wday
    end_day_number = (begin_day.next_month - 1).day

    day_number = - begin_weekday
    c = []
    while day_number < end_day_number
      w = []
      (0..6).each do |wday|
        day_number += 1
        if day_number <= 0
          w << nil
          next
        end
        if day_number > end_day_number
          w << nil
          next
        end
        w << day_number
      end
      c << w
    end
    return c
  end

  module ActionViewExtension
    # Your code goes here...
    def yearly_calendar(year_number, options = {})
      render '../app/views/r_calendar/_a_year.html.erb', :year_number => year_number
    end

    def monthly_calendar(year_number, month_number, options = {})
      render '../app/views/r_calendar/_a_month.html.erb', :year_number => year_number, :month_number => month_number
    end
  end
end

if defined?(ActiveSupport)
  ActiveSupport.on_load(:action_view) do
    ::ActionView::Base.send :include, RCalendar::ActionViewExtension
  end
end
