require 'date'
require 'action_view'
require 'active_support'
require "r_calendar/version"

module RCalendar
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

ActiveSupport.on_load(:action_view) do
  ::ActionView::Base.send :include, RCalendar::ActionViewExtension
end
