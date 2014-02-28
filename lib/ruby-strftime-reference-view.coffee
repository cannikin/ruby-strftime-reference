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
          @td class: 'directive', "%Y"
          @td class: 'description', =>
            @div "Year with century (can be negative, 4 digits at least)"
            @div class: 'examples', " -0001, 0000, 1995, 2009, 14292, etc."
        @tr =>
          @td class: 'directive', "%C"
          @td class: 'description', "year / 100 (rounded down such as 20 in 2009)"
        @tr =>
          @td class: 'directive', "%y"
          @td class: 'description', "year % 100 (00..99)`"
        @tr =>
          @td class: 'directive', "%m"
          @td class: 'description', =>
            @div "Month of the year, zero-padded (01..12)"
            @div class: 'example', =>
              @span class: 'directive', "%_m"
              @span "blank-padded ( 1..12)"
            @div class: 'example', =>
              @span class: 'directive', "%-m"
              @span "no-padded (1..12)"
        @tr =>
          @td class: 'directive', "%B"
          @td class: 'description', =>
            @div "The full month name ('January')"
            @div class: 'example', =>
              @span class: 'directive', "%^B"
              @span "uppercased ('JANUARY')"
        @tr =>
          @td class: 'directive', "%b"
          @td class: 'description', =>
            @div "The abbreviated month name ('Jan')"
            @div class: 'example', =>
              @span class: 'directive', "%^b"
              @span "uppercased ('JAN')"
        @tr =>
          @td class: 'directive', "%h"
          @td class: 'description', "Equivalent to %b"
        @tr =>
          @td class: 'directive', "%d"
          @td class: 'description', =>
            @div "Day of the month, zero-padded (01..31)"
            @div class: 'example', =>
              @span class: 'directive', "%-d"
              @span "no-padded (1..31)"
        @tr =>
          @td class: 'directive', "%e"
          @td class: 'description', "Day of the month, blank-padded ( 1..31)"
        @tr =>
          @td class: 'directive', "%j"
          @td class: 'description', "Day of the year (001..366)"
        @tr =>
          @td colspan: "2", =>
            @h2 "Time (Hour, Minute, Second, Subsecond)"
        @tr =>
          @td class: 'directive', "%H"
          @td class: 'description', "Hour of the day, 24-hour clock, zero-padded (00..23)"
        @tr =>
          @td class: 'directive', "%k"
          @td class: 'description', "Hour of the day, 24-hour clock, blank-padded ( 0..23)"
        @tr =>
          @td class: 'directive', "%I"
          @td class: 'description', "Hour of the day, 12-hour clock, zero-padded (01..12)"
        @tr =>
          @td class: 'directive', "%l"
          @td class: 'description', "Hour of the day, 12-hour clock, blank-padded ( 1..12)"
        @tr =>
          @td class: 'directive', "%P"
          @td class: 'description', "Meridian indicator, lowercase ('am' or 'pm')"
        @tr =>
          @td class: 'directive', "%p"
          @td class: 'description', "Meridian indicator, uppercase ('AM' or 'PM')"
        @tr =>
          @td class: 'directive', "%M"
          @td class: 'description', "Minute of the hour (00..59)"
        @tr =>
          @td class: 'directive', "%S"
          @td class: 'description', "Second of the minute (00..60)"
        @tr =>
          @td class: 'directive', "%L"
          @td class: 'description', =>
            @div "Millisecond of the second (000..999)"
            @div "The digits under millisecond are truncated to not produce 1000."
        @tr =>
          @td class: 'directive', "%N"
          @td class: 'description', =>
            @div "Fractional seconds digits, default is 9 digits (nanosecond)"
            @div class: 'example', =>
              @span class: 'directive', "%3N"
              @span "millisecond (3 digits)"
            @div class: 'example', =>
              @span class: 'directive', "%6N"
              @span "microsecond (6 digits)"
            @div class: 'example', =>
              @span class: 'directive', "%9N"
              @span "nanosecond (9 digits)"
            @div class: 'example', =>
              @span class: 'directive', "%12N"
              @span "picosecond (12 digits)"
            @div class: 'example', =>
              @span class: 'directive', "%15N"
              @span "femtosecond (15 digits)"
            @div class: 'example', =>
              @span class: 'directive', "%18N"
              @span "attosecond (18 digits)"
            @div class: 'example', =>
              @span class: 'directive', "%21N"
              @span "zeptosecond (21 digits)"
            @div class: 'example', =>
              @span class: 'directive', "%24N"
              @span "yoctosecond (24 digits)"
            @div "The digits under the specified length are truncated to avoid
       carry up."

  initialize: ->
    @subscribe atom.workspaceView, 'core:cancel', => @detach()
    atom.workspaceView.prepend(this)

  detach: ->
    @unsubscribe()
    atom.workspaceView.focus()
    super()
