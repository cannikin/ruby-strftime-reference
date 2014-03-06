# fs = require 'fs'
# path = require 'path'

{$, View} = require 'atom'
# Q = require 'q'
# request = require 'request'

# StoredFeedbackText = null

module.exports =
class RubyStrftimeReferenceView extends View
  @content: ->
    @div tabindex: -1, class: 'ruby-strftime-reference overlay from-top', =>
      @h1 "Ruby strftime Reference"
      @table =>
        @tr =>
          @td colspan: "2", =>
            @h2 "Date (Year, Month, Day)"
        @tr =>
          @td class: 'directive', =>
            @code "%Y"
          @td class: 'description', =>
            @div "Year with century (can be negative, 4 digits at least)"
            @div class: 'examples', " -0001, 0000, 1995, 2009, 14292, etc."
        @tr =>
          @td class: 'directive', =>
            @code "%C"
          @td class: 'description', "year / 100 (rounded down such as 20 in 2009)"
        @tr =>
          @td class: 'directive', =>
            @code "%y"
          @td class: 'description', "year % 100 (00..99)`"
        @tr =>
          @td class: 'directive', =>
            @code "%m"
          @td class: 'description', =>
            @div "Month of the year, zero-padded (01..12)"
            @div class: 'example', =>
              @span class: 'directive', =>
                @code "%_m"
              @span "blank-padded ( 1..12)"
            @div class: 'example', =>
              @span class: 'directive', =>
                @code "%-m"
              @span "no-padded (1..12)"
        @tr =>
          @td class: 'directive', =>
            @code "%B"
          @td class: 'description', =>
            @div "The full month name ('January')"
            @div class: 'example', =>
              @span class: 'directive', =>
                @code "%^B"
              @span "uppercased ('JANUARY')"
        @tr =>
          @td class: 'directive', =>
            @code "%b"
          @td class: 'description', =>
            @div "The abbreviated month name ('Jan')"
            @div class: 'example', =>
              @span class: 'directive', =>
                @code "%^b"
              @span "uppercased ('JAN')"
        @tr =>
          @td class: 'directive', =>
            @code "%h"
          @td class: 'description', "Equivalent to %b"
        @tr =>
          @td class: 'directive', =>
            @code "%d"
          @td class: 'description', =>
            @div "Day of the month, zero-padded (01..31)"
            @div class: 'example', =>
              @span class: 'directive', =>
                @code "%-d"
              @span "no-padded (1..31)"
        @tr =>
          @td class: 'directive', =>
            @code "%e"
          @td class: 'description', "Day of the month, blank-padded ( 1..31)"
        @tr =>
          @td class: 'directive', =>
            @code "%j"
          @td class: 'description', "Day of the year (001..366)"
        @tr =>
          @td colspan: "2", =>
            @h2 "Time (Hour, Minute, Second, Subsecond)"
        @tr =>
          @td class: 'directive', =>
            @code "%H"
          @td class: 'description', "Hour of the day, 24-hour clock, zero-padded (00..23)"
        @tr =>
          @td class: 'directive', =>
            @code "%k"
          @td class: 'description', "Hour of the day, 24-hour clock, blank-padded ( 0..23)"
        @tr =>
          @td class: 'directive', =>
            @code "%I"
          @td class: 'description', "Hour of the day, 12-hour clock, zero-padded (01..12)"
        @tr =>
          @td class: 'directive', =>
            @code "%l"
          @td class: 'description', "Hour of the day, 12-hour clock, blank-padded ( 1..12)"
        @tr =>
          @td class: 'directive', =>
            @code "%P"
          @td class: 'description', "Meridian indicator, lowercase ('am' or 'pm')"
        @tr =>
          @td class: 'directive', =>
            @code "%p"
          @td class: 'description', "Meridian indicator, uppercase ('AM' or 'PM')"
        @tr =>
          @td class: 'directive', =>
            @code "%M"
          @td class: 'description', "Minute of the hour (00..59)"
        @tr =>
          @td class: 'directive', =>
            @code "%S"
          @td class: 'description', "Second of the minute (00..60)"
        @tr =>
          @td class: 'directive', =>
            @code "%L"
          @td class: 'description', =>
            @div "Millisecond of the second (000..999)"
            @div "The digits under millisecond are truncated to not produce 1000."
        @tr =>
          @td class: 'directive', =>
            @code "%N"
          @td class: 'description', =>
            @div "Fractional seconds digits, default is 9 digits (nanosecond)"
            @div class: 'example', =>
              @span class: 'directive', =>
                @code "%3N"
              @span "millisecond (3 digits)"
            @div class: 'example', =>
              @span class: 'directive', =>
                @code "%6N"
              @span "microsecond (6 digits)"
            @div class: 'example', =>
              @span class: 'directive', =>
                @code "%9N"
              @span "nanosecond (9 digits)"
            @div class: 'example', =>
              @span class: 'directive', =>
                @code "%12N"
              @span "picosecond (12 digits)"
            @div class: 'example', =>
              @span class: 'directive', =>
                @code "%15N"
              @span "femtosecond (15 digits)"
            @div class: 'example', =>
              @span class: 'directive', =>
                @code "%18N"
              @span "attosecond (18 digits)"
            @div class: 'example', =>
              @span class: 'directive', =>
                @code "%21N"
              @span "zeptosecond (21 digits)"
            @div class: 'example', =>
              @span class: 'directive', =>
                @code "%24N"
              @span "yoctosecond (24 digits)"
            @div "The digits under the specified length are truncated to avoid
       carry up."
        @tr =>
          @td colspan: "2", =>
            @h2 "Time zone"
        @tr =>
          @td class: 'directive', =>
            @code "%z"
          @td class: 'description', =>
            @div "Time zone as hour and minute offset from UTC (e.g. +0900)"
            @div class: 'example', =>
              @span class: 'directive', =>
                @code "%:z"
              @span "hour and minute offset from UTC with a colon (e.g. +09:00)"
            @div class: 'example', =>
              @span class: 'directive', =>
                @code "%::z"
              @span "hour, minute and second offset from UTC (e.g. +09:00:00)"
            @div class: 'example', =>
              @span class: 'directive', =>
                @code "%:::z"
              @span "hour, minute and second offset from UTC (e.g. +09, +09:30, +09:30:30)"
        @tr =>
          @td colspan: "2", =>
            @h2 "Weekday"
        @tr =>
          @td class: 'directive', =>
            @code "%A"
          @td class: 'description', =>
            @div "The full weekday name ('Sunday')"
            @div class: 'example', =>
              @span class: 'directive', =>
                @code "%^A"
              @span "uppercased ('SUNDAY')"
        @tr =>
          @td class: 'directive', =>
            @code "%a"
          @td class: 'description', =>
            @div "The abbreviated name ('Sun')"
            @div class: 'example', =>
              @span class: 'directive', =>
                @code "%^a"
              @span "uppercased ('SUN')"
        @tr =>
          @td class: 'directive', =>
            @code "%u"
          @td class: 'description', "Day of the week (Monday is 1, 1..7)"
        @tr =>
          @td class: 'directive', =>
            @code "%w"
          @td class: 'description', "Day of the week (Sunday is 0, 0..6)"
        @tr =>
          @td colspan: "2", =>
            @h2 "ISO 8601 week-based year and week number"
        @tr =>
          @td colspan: "2", "The week 1 of YYYY starts with a Monday and includes YYYY-01-04. The days in the year before the first week are in the last week of the previous year."
        @tr =>
          @td class: 'directive', =>
            @code "%G"
          @td class: 'description', "The week-based year"
        @tr =>
          @td class: 'directive', =>
            @code "%g"
          @td class: 'description', "The last 2 digits of the week-based year (00..99)"
        @tr =>
          @td class: 'directive', =>
            @code "%V"
          @td class: 'description', "Week number of the week-based year (01..53)"
        @tr =>
          @td colspan: "2", =>
            @h2 "Week number"
        @tr =>
          @td colspan: "2", "The week 1 of YYYY starts with a Sunday or Monday (according to %U or %W).  The days in the year before the first week are in week 0."
        @tr =>
          @td class: 'directive', =>
            @code "%U"
          @td class: 'description', "Week number of the year.  The week starts with Sunday.  (00..53)"
        @tr =>
          @td class: 'directive', =>
            @code "%W"
          @td class: 'description', "Week number of the year.  The week starts with Monday.  (00..53)"
        @tr =>
          @td colspan: "2", =>
            @h2 "Seconds since the Epoch"
        @tr =>
          @td class: 'directive', =>
            @code "%s"
          @td class: 'description', "Number of seconds since 1970-01-01 00:00:00 UTC."
        @tr =>
          @td colspan: "2", =>
            @h2 "Literal string"
        @tr =>
          @td class: 'directive', =>
            @code "%n"
          @td class: 'description', "Newline character (\\n)"
        @tr =>
          @td class: 'directive', =>
            @code "%t"
          @td class: 'description', "Tab character (\\t)"
        @tr =>
          @td class: 'directive', =>
            @code "%%"
          @td class: 'description', "Literal '%' character"
        @tr =>
          @td colspan: "2", =>
            @h2 "Combination"
        @tr =>
          @td class: 'directive', =>
            @code "%c"
          @td class: 'description', "date and time (%a %b %e %T %Y)"
        @tr =>
          @td class: 'directive', =>
            @code "%D"
          @td class: 'description', "Date (%m/%d/%y)"
        @tr =>
          @td class: 'directive', =>
            @code "%F"
          @td class: 'description', "The ISO 8601 date format (%Y-%m-%d)"
        @tr =>
          @td class: 'directive', =>
            @code "%v"
          @td class: 'description', "VMS date (%e-%^b-%4Y)"
        @tr =>
          @td class: 'directive', =>
            @code "%x"
          @td class: 'description', "Same as %D"
        @tr =>
          @td class: 'directive', =>
            @code "%X"
          @td class: 'description', "Same as %T"
        @tr =>
          @td class: 'directive', =>
            @code "%r"
          @td class: 'description', "12-hour time (%I:%M:%S %p)"
        @tr =>
          @td class: 'directive', =>
            @code "%R"
          @td class: 'description', "24-hour time (%H:%M)"
        @tr =>
          @td class: 'directive', =>
            @code "%T"
          @td class: 'description', "24-hour time (%H:%M:%S)"

  initialize: ->
    @subscribe atom.workspaceView, 'core:cancel', => @detach()
    atom.workspaceView.prepend(this)

  detach: ->
    @unsubscribe()
    atom.workspaceView.focus()
    super()
