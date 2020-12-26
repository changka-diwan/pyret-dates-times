#lang scribble/manual

@(require "../../scribble-api.rkt" "../abbrevs.rkt")
@(require (only-in scribble/core delayed-block))

@(define (nd-method name #:args args #:return ret #:contract contract)
   (method-doc "NaiveDate" "naive-date" name #:alt-docstrings "" #:args args #:return ret #:contract contract))

@(append-gen-docs
  `(module "naive-date"
     (path "src/js/base/runtime-anf.js")
     (data-spec
      (name "NaiveDate")
      (variants ("naive-date" "naive-time" "offset-time" "naive-date-time" "utc-date-time" "offset-date-time" "zoned-date-time"))
      (shared (
               (method-spec (name "at-start-of-day"))
               (method-spec (name "zoned-start-of-day"))
               (method-spec (name "at-time-any"))
               (method-spec (name "at-naive-time"))
               (method-spec (name "at-offset-time"))
               (method-spec (name "get-day-of-month"))
               (method-spec (name "get-month-value"))
               (method-spec (name "get-year"))
               (method-spec (name "is-leap-year"))
               (method-spec (name "is-before"))
               (method-spec (name "is-after"))
               (method-spec (name "until"))
               (method-spec (name "minus"))
               (method-spec (name "minus-duration"))
               (method-spec (name "minus-days"))
               (method-spect(name "minus-weeks"))
               (method-spec (name "minus-months"))
               (method-spec (name "minus-years"))
               (method-spec (name "plus-duration"))
               (method-spec (name "plus-days"))
               (method-spec (name "plus-weeks"))
               (method-spec (name "plus-months"))
               (method-spec (name "plus-years"))
               (method-spec (name "to-string"))
               (method-spec (name "get-remaining-days-in-year"))
               (method-spec (name "get-days-in-year-till-date"))
               (method-spec (name "with-unit"))
               (method-spec (name "with-day"))
               (method-spec (name "with-month"))
               (method-spec (name "with-year"))
               (method-spec (name "successor"))
               (method-spec (name "predecessor"))
               )))
     (fun-spec (name "make-naive-date"))
     (fun-spec (name "naive-date"))
     @;{
     (fun-spec (name "duration-of-any"))
     (fun-spec (name "duration-of-ymd"))
     (fun-spec (name "duration-of-hms"))
     (fun-spec (name "duration-of-years"))
     (fun-spec (name "duration-of-months"))
     (fun-spec (name "duration-of-days"))
     (fun-spec (name "duration-of-hours"))
     (fun-spec (name "duration-of-minutes"))
     (fun-spec (name "duration-of-seconds"))
     }
     ))

@docmodule["naive-date"]{

 @ignore[(list "make-naive-date")]

 @section{The NaiveDate Datatype}
 TODO
 @;{
 @data-spec2["NaiveDate" '() (list
                             @constructor-spec["Temporal" "naive-date"
                                               (list `("year" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("month" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("day" ("type" "normal") ("contract" ,(a-id "Number"))))]
                             @constructor-spec["Temporal" "naive-time"
                                               (list `("hour" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("minute" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("second" ("type" "normal") ("contract" ,(a-id "Number"))))]
                             @constructor-spec["Temporal" "naive-date-time"
                                               (list `("year" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("month" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("day" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("hour" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("minute" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("second" ("type" "normal") ("contract" ,(a-id "Number"))))]
                             @constructor-spec["Temporal" "offset-time"
                                               (list `("hour" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("minute" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("second" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("offset" ("type" "normal") ("contract" ,(a-id "ZoneOffset"))))]
                             @constructor-spec["Temporal" "utc-date-time"
                                               (list `("year" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("month" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("day" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("hour" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("minute" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("second" ("type" "normal") ("contract" ,(a-id "Number"))))]
                             @constructor-spec["Temporal" "offset-date-time"
                                               (list `("year" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("month" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("day" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("hour" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("minute" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("second" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("offset" ("type" "normal") ("contract" ,(a-id "ZoneOffset"))))]
                             @constructor-spec["Temporal" "zoned-date-time"
                                               (list `("year" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("month" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("day" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("hour" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("minute" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("second" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("zone-id" ("type" "normal") ("contract" ,(a-id "ZoneID"))))])]
 
 @nested[#:style 'inset]{                  
  TODO
  
 }
}
 @section{NaiveDate Methods}

 @nd-method["at-start-of-day"
           #:contract (a-arrow ND NDT)
           #:args (list (list "self" #f))
           #:return NDT
           ]

 Combines this date with the time of midnight to create a
 Temporal%(is-naive-date-time) at the start of this date.

 @examples{
  check:
  1 is 1
  end
 }

 @nd-method["zoned-start-of-day"
           #:contract (a-arrow ND ZI ZDT)
           #:args (list (list "self" #f) (list "zone-id" #f))
           #:return ZDT
           ]

 Returns a zoned date-time from this date at the earliest valid time according to the rules in the time-zone.`

 @examples{
  check:
  1 is 1
  end
 }

 @nd-method["at-time-any"
           #:contract (a-arrow ND N N N NDT)
           #:args (list (list "self" #f) (list "hour" #f) (list "minute" #f) (list "second" #f))
           #:return NDT
           ]

Combines this date with a time to create a Temporal%(is-naive-date-time).

 @examples{
  check:
  1 is 1
  end
 }

 @nd-method["at-naive-time"
           #:contract (a-arrow ND NT NDT)
           #:args (list (list "self" #f) (list "time" #f))
           #:return NDT
           ]

Combines this date with a time to create a Temporal%(is-naive-date-time).

 @examples{
  check:
  1 is 1
  end
 }

 @nd-method["at-offset-time"
           #:contract (a-arrow ND OT ODT)
           #:args (list (list "self" #f) (list "time" #f))
           #:return ODT
           ]

 Combines this date with an offset time to create an Temporal%(is-offset-date-time).

 @examples{
  check:
  1 is 1
  end
 }

 @nd-method["get-day-of-month"
           #:contract (a-arrow ND N)
           #:args (list (list "self" #f))
           #:return N
           ]

 Gets the value of the day unit.

 @examples{
  check:
  1 is 1
  end
 }

 @nd-method["get-month-value"
           #:contract (a-arrow ND N)
           #:args (list (list "self" #f))
           #:return N
           ]

 "Gets the value of the month unit from 1 to 12."

 @examples{
  check:
  1 is 1
  end
 }

 @nd-method["get-year"
           #:contract (a-arrow ND N)
           #:args (list (list "self" #f))
           #:return N
           ]

 "Gets the value of the year unit."

 @examples{
  check:
  1 is 1
  end
 }

 @nd-method["is-leap-year"
           #:contract (a-arrow ND B)
           #:args (list (list "self" #f))
           #:return B
           ]

 Checks if the year of this date is a leap year, according to the ISO proleptic calendar system rules.

 @examples{
  check:
  1 is 1
  end
 }

 @nd-method["is-before"
           #:contract (a-arrow ND ND B)
           #:args (list (list "self" #f) (list "compare-with" #f))
           #:return B
           ]

 Determines whether the current date occurs before the date it is being compared with.

 @examples{
  check:
  1 is 1
  end
 }

 @nd-method["is-after"
           #:contract (a-arrow ND ND B)
           #:args (list (list "self" #f) (list "compare-with" #f))
           #:return B
           ]

 Determines whether the current date occurs after the date it is being compared with.

 @examples{
  check:
  1 is 1
  end
 }

 @nd-method["until"
           #:contract (a-arrow ND ND D)
           #:args (list (list "self" #f) (list "other" #f))
           #:return D
           ]

 Calculates the amount of time until another date.

 @examples{
  check:
  1 is 1
  end
 }

 @nd-method["minus"
           #:contract (a-arrow ND ND D)
           #:args (list (list "self" #f) (list "other" #f))
           #:return D
           ]

 Calculates the duration of days to add to 'other' to get the date in question.

 @examples{
  check:
  1 is 1
  end
 }

 @nd-method["minus-duration"
           #:contract (a-arrow ND D ND)
           #:args (list (list "self" #f) (list "amount" #f))
           #:return ND
           ]

 Returns a copy of this date with the specified duration subtracted.
 (month => 30 days, year => 365 days inside a duration)

 @examples{
  check:
  1 is 1
  end
 }

 @nd-method["minus-days"
           #:contract (a-arrow ND N ND)
           #:args (list (list "self" #f) (list "days" #f))
           #:return ND
           ]

 Returns a copy of this NaiveDate with the specified duration of days subtracted.

 @examples{
  check:
  1 is 1
  end
 }

  @nd-method["minus-weeks"
           #:contract (a-arrow ND N ND)
           #:args (list (list "self" #f) (list "weeks" #f))
           #:return ND
           ]

 Returns a copy of this NaiveDate with the specified duration of weeks subtracted.

 @nd-method["minus-months"
           #:contract (a-arrow ND N ND)
           #:args (list (list "self" #f) (list "months" #f))
           #:return ND
           ]

 Returns a copy of this NaiveDate with the specified duration of months subtracted.

 @examples{
  check:
  1 is 1
  end
 }

 @nd-method["minus-years"
           #:contract (a-arrow ND N ND)
           #:args (list (list "self" #f) (list "years" #f))
           #:return ND
           ]

 Returns a copy of this NaiveDate with the specified duration of years subtracted.

 @examples{
  check:
  1 is 1
  end
 }

 @nd-method["plus-duration"
           #:contract (a-arrow ND D ND)
           #:args (list (list "self" #f) (list "amount" #f))
           #:return ND
           ]

 Returns a copy of this date with the specified duration added.
 (month => 30 days, year => 365 days inside a duration)

 @examples{
  check:
  1 is 1
  end
 }

 @nd-method["plus-days"
           #:contract (a-arrow ND N ND)
           #:args (list (list "self" #f) (list "days" #f))
           #:return ND
           ]

 Returns a copy of this NaiveDate with the specified duration of days added.

 @examples{
  check:
  1 is 1
  end
 }

  @nd-method["plus-weeks"
           #:contract (a-arrow ND N ND)
           #:args (list (list "self" #f) (list "weeks" #f))
           #:return ND
           ]

 Returns a copy of this NaiveDate with the specified duration of weeks added.

 @nd-method["plus-months"
           #:contract (a-arrow ND N ND)
           #:args (list (list "self" #f) (list "months" #f))
           #:return ND
           ]

 Returns a copy of this NaiveDate with the specified duration of months added.

 @examples{
  check:
  1 is 1
  end
 }

 @nd-method["plus-years"
           #:contract (a-arrow ND N ND)
           #:args (list (list "self" #f) (list "years" #f))
           #:return ND
           ]

 Returns a copy of this NaiveDate with the specified duration of years added.

 @examples{
  check:
  1 is 1
  end
 }
 
 @nd-method["to-string"
           #:contract (a-arrow ND S)
           #:args (list (list "self" #f))
           #:return S
           ]

 Outputs this date as a String, such as 2007-12-03.

 @examples{
  check:
  1 is 1
  end
 }

 @nd-method["get-remaining-days-in-year"
           #:contract (a-arrow ND N)
           #:args (list (list "self" #f))
           #:return N
           ]

 Returns the number of days remaining in a year.

 @examples{
  check:
  1 is 1
  end
 }

 @nd-method["get-days-in-year-till-date"
           #:contract (a-arrow ND N)
           #:args (list (list "self" #f))
           #:return N
           ]

 Returns the number of days that have occurred in a year so far.

 @examples{
  check:
  1 is 1
  end
 }

 @nd-method["with-unit"
           #:contract (a-arrow ND TU N ND)
           #:args (list (list "self" #f) (list "unit" #f) (list "val" #f))
           #:return ND
           ]

 Returns a copy of this date with the specified unit set to a new value.

 @examples{
  check:
  1 is 1
  end
 }

 @nd-method["with-day"
           #:contract (a-arrow ND N ND)
           #:args (list (list "self" #f) (list "day" #f))
           #:return ND
           ]

 Returns a copy of this NaiveDate with the day-of-month altered.

 @examples{
  check:
  1 is 1
  end
 }

 @nd-method["with-month"
           #:contract (a-arrow ND N ND)
           #:args (list (list "self" #f) (list "month" #f))
           #:return ND
           ]

 Returns a copy of this NaiveDate with the month value altered.

 @examples{
  check:
  1 is 1
  end
 }

 @nd-method["with-year"
           #:contract (a-arrow ND N ND)
           #:args (list (list "self" #f) (list "year" #f))
           #:return ND
           ]

 Returns a copy of this NaiveDate with the year value altered.

 @examples{
  check:
  1 is 1
  end
 }

 @nd-method["successor"
           #:contract (a-arrow ND ND)
           #:args (list (list "self" #f))
           #:return ND
           ]

 Returns a copy of this NaiveDate with the day incremented by 1.

 @examples{
  check:
  1 is 1
  end
 }

 @nd-method["predecessor"
           #:contract (a-arrow ND ND)
           #:args (list (list "self" #f))
           #:return ND
           ]

 Returns a copy of this NaiveDate with the day decreased by 1.

 @examples{
  check:
  1 is 1
  end
 }
@;{
 @section{NaiveDate Functions}

 These functions require the Temporal module to be
 @pyret{import}ed, as indicated in the examples.

 @function["naive-date-of-any"
           #:contract (a-arrow N N N ND)
           #:args '(("years" #f) ("months" #f) ("days" #f))
           #:return ND
           ]{

  Obtains an instance of NaiveDate from a year, month and day.

  @examples{
   import duration as D
   check:
   1 is 1
   end
  }
 }

 @function["parse-naive-date"
           #:contract (a-arrow S ND)
           #:args '(("text" #f))
           #:return ND
           ]{

  Obtains an instance of NaiveDate from a text string such as 2007-12-03.

  @examples{
   import duration as D
   check:
   1 is 1
   end
  }
 }

 @function["naive-date-now"
           #:contract (a-arrow ND)
           #:args '()
           #:return ND
           ]{

  Obtains the current date from the system clock in the default time-zone.

  @examples{
   import duration as D
   check:
   1 is 1
   end
  }
 }

 @function["naive-date-from-zone-now"
           #:contract (a-arrow ND)
           #:args '()
           #:return ND
           ]{

  Obtains the current date from the system clock in the specified time-zone.

  @examples{
   import duration as D
   check:
   1 is 1
   end
  }
 }

 @section{NaiveTime Methods}

 @nt-method["at-date"
            #:contract (a-arrow NT ND NDT)
            #:args (list (list "self" #f) (list "date" #f))
            #:return NDT
            ]

Combines this time with a date to create a Temporal%(is-naive-date-time).

 @examples{
  check:
  1 is 1
  end
 }

 @nt-method["at-offset"
           #:contract (a-arrow NT ZO OT)
           #:args (list (list "self" #f) (list "offset" #f))
           #:return OT
           ]

 Combines this time with an offset to create an Temporal%(is-offset-time).

 @examples{
  check:
  1 is 1
  end
 }

 @nt-method["get-second"
           #:contract (a-arrow NT N)
           #:args (list (list "self" #f))
           #:return N
           ]

Gets the value of the seconds unit.

 @examples{
  check:
  1 is 1
  end
 }

 @nt-method["get-minute"
           #:contract (a-arrow NT N)
           #:args (list (list "self" #f))
           #:return N
           ]

Gets the value of the minutes unit.

 @examples{
  check:
  1 is 1
  end
 }

 @nt-method["get-hour"
           #:contract (a-arrow NT N)
           #:args (list (list "self" #f))
           #:return N
           ]

 Gets the value of the hours unit.

 @examples{
  check:
  1 is 1
  end
 }

 @nt-method["is-after"
           #:contract (a-arrow NT NT B)
           #:args (list (list "self" #f) (list "other" #f))
           #:return B
           ]

 Checks if this Temporal%(is-naive-time) is after the specified Temporal%(is-naive-time).

 @examples{
  check:
  1 is 1
  end
 }

 @nt-method["is-before"
           #:contract (a-arrow NT NT B)
           #:args (list (list "self" #f) (list "other" #f))
           #:return B
           ]

 Checks if this Temporal%(is-naive-time) is before the specified Temporal%(is-naive-time).

 @examples{
  check:
  1 is 1
  end
 }

 @nt-method["minus"
           #:contract (a-arrow NT D NT)
           #:args (list (list "self" #f) (list "amt" #f))
           #:return NT
           ]

 Returns a copy of this time with the specified amount subtracted.

 @examples{
  check:
  1 is 1
  end
 }

 @nt-method["minus-seconds"
           #:contract (a-arrow NT N NT)
           #:args (list (list "self" #f) (list "seconds" #f))
           #:return NT
           ]

  Returns a copy of this time with the specified number of seconds subtracted.

 @examples{
  check:
  1 is 1
  end
 }

 @nt-method["minus-minutes"
           #:contract (a-arrow NT N NT)
           #:args (list (list "self" #f) (list "minutes" #f))
           #:return NT
           ]

  Returns a copy of this time with the specified number of minutes subtracted.

 @examples{
  check:
  1 is 1
  end
 }

  @nt-method["minus-hours"
           #:contract (a-arrow NT N NT)
           #:args (list (list "self" #f) (list "hours" #f))
           #:return NT
           ]

  Returns a copy of this time with the specified number of hours subtracted.

 @examples{
  check:
  1 is 1
  end
 }
 
 @nt-method["plus"
           #:contract (a-arrow NT D NT)
           #:args (list (list "self" #f) (list "amt" #f))
           #:return NT
           ]

 Returns a copy of this time with the specified amount added.

 @examples{
  check:
  1 is 1
  end
 }

 @nt-method["plus-seconds"
           #:contract (a-arrow NT N NT)
           #:args (list (list "self" #f) (list "seconds" #f))
           #:return NT
           ]

 Returns a copy of this time with the specified number of seconds added.

 @examples{
  check:
  1 is 1
  end
 }

@nt-method["plus-minutes"
           #:contract (a-arrow NT N NT)
           #:args (list (list "self" #f) (list "minutes" #f))
           #:return NT
           ]

 Returns a copy of this time with the specified number of minutes added.

 @examples{
  check:
  1 is 1
  end
 }

 @nt-method["plus-hours"
           #:contract (a-arrow NT N NT)
           #:args (list (list "self" #f) (list "hours" #f))
           #:return NT
           ]

 Returns a copy of this time with the specified number of hours added.

 @examples{
  check:
  1 is 1
  end
 }
 
 @nt-method["to-string"
           #:contract (a-arrow NT S)
           #:args (list (list "self" #f))
           #:return S
           ]

 Outputs this time as a String, such as 10:15:30

 @examples{
  check:
  1 is 1
  end
 }

 @nt-method["to-second-of-day"
           #:contract (a-arrow NT N)
           #:args (list (list "self" #f))
           #:return N
           ]

 Extracts the time as seconds of day, from 0 to 24 * 60 * 60 - 1.

 @examples{
  check:
  1 is 1
  end
 }

 @nt-method["until"
           #:contract (a-arrow NT NT D)
           #:args (list (list "self" #f) (list "other" #f))
           #:return D
           ]

 Calculates the normalized duration of time until another time.

 @examples{
  check:
  1 is 1
  end
 }

 @nt-method["with-unit"
           #:contract (a-arrow NT TU N NT)
           #:args (list (list "self" #f) (list "unit" #f) (list "val" #f))
           #:return NT
           ]

 Returns a copy of this time with the specified unit set to a new value.

 @examples{
  check:
  1 is 1
  end
 }

  @nt-method["with-second"
           #:contract (a-arrow NT N NT)
           #:args (list (list "self" #f) (list "second" #f))
           #:return NT
           ]

 Returns a copy of this temporal with the seconds altered.

 @examples{
  check:
  1 is 1
  end
 }

 @nt-method["with-minute"
           #:contract (a-arrow NT N NT)
           #:args (list (list "self" #f) (list "minute" #f))
           #:return NT
           ]

 Returns a copy of this temporal with the minutes altered.

 @examples{
  check:
  1 is 1
  end
 }

  @nt-method["with-hour"
           #:contract (a-arrow NT N NT)
           #:args (list (list "self" #f) (list "hour" #f))
           #:return NT
           ]

 Returns a copy of this temporal with the hours altered.

 @examples{
  check:
  1 is 1
  end
 }

 @section{NaiveTime Functions}

 These functions require the Temporal module to be
 @pyret{import}ed, as indicated in the examples.

 @function["naive-time-of-any"
           #:contract (a-arrow N N N NT)
           #:args (list (list "hour" #f) (list "month" #f) (list "day" #f))
           #:return NT
           ]{

  Obtains an instance of NaiveTime from a year, month and day.

  @examples{
   import temporal as T
   check:
   1 is 1
   end
  }
 }

 @function["naive-time-now"
           #:contract (a-arrow NT)
           #:args '()
           #:return NT
           ]{

  Obtains the current time from the system clock in the default time-zone.

  @examples{
   import temporal as T
   check:
   1 is 1
   end
  }
 }

 @function["naive-time-from-zone-now"
           #:contract (a-arrow NT)
           #:args '()
           #:return NT
           ]{

  Obtains the current time from the system clock in the specified time-zone.

  @examples{
   import temporal as T
   check:
   1 is 1
   end
  }
 }

 @function["parse-naive-time"
           #:contract (a-arrow S NT)
           #:args (list (list "text" #f))
           #:return NT
           ]{

  Obtains an instance of Temporal%(is-naive-time) from a text string such as 23:59:59

  @examples{
   import temporal as T
   check:
   1 is 1
   end
  }
 }

 @section{OffsetTime Methods}

 @ot-method["at-date"
            #:contract (a-arrow OT ND ODT)
            #:args (list (list "self" #f) (list "date" #f))
            #:return ODT
            ]

Combines this time with a date to create a Temporal%(is-offset-date-time).

 @examples{
  check:
  1 is 1
  end
 }

 @ot-method["at-offset"
           #:contract (a-arrow OT ZO OT)
           #:args (list (list "self" #f) (list "offset" #f))
           #:return OT
           ]

 Combines this time with an offset to create an Temporal%(is-offset-time).

 @examples{
  check:
  1 is 1
  end
 }

 @ot-method["get-second"
           #:contract (a-arrow OT N)
           #:args (list (list "self" #f))
           #:return N
           ]

Gets the value of the seconds unit.

 @examples{
  check:
  1 is 1
  end
 }

 @ot-method["get-minute"
           #:contract (a-arrow OT N)
           #:args (list (list "self" #f))
           #:return N
           ]

Gets the value of the minutes unit.

 @examples{
  check:
  1 is 1
  end
 }

 @ot-method["get-hour"
           #:contract (a-arrow OT N)
           #:args (list (list "self" #f))
           #:return N
           ]

 Gets the value of the hours unit.

 @examples{
  check:
  1 is 1
  end
 }

 @ot-method["get-naive-time"
           #:contract (a-arrow OT NT)
           #:args (list (list "self" #f))
           #:return NT
           ]

 Gets the NaiveTime component from the OffsetTime in question.

 @examples{
  check:
  1 is 1
  end
 }

 @ot-method["to-utc-time"
           #:contract (a-arrow OT OT)
           #:args (list (list "self" #f))
           #:return OT
           ]

 Returns an OffsetTime with the time component representing the equivalent time in UTC and the ZoneOffset set to zero.

 @examples{
  check:
  1 is 1
  end
 }

@ot-method["with-offset-same-naive"
           #:contract (a-arrow OT OT)
           #:args (list (list "self" #f))
           #:return OT
           ]

 Returns a copy of this OffsetTime with an offset of zero magnitude ensuring that the result has the same naive time.

 @examples{
  check:
  1 is 1
  end
 }
 
 @ot-method["is-after"
           #:contract (a-arrow OT OT B)
           #:args (list (list "self" #f) (list "other" #f))
           #:return B
           ]

 Checks if this Temporal%(is-offset-time) is after the specified Temporal%(is-offset-time).

 @examples{
  check:
  1 is 1
  end
 }

 @ot-method["is-before"
           #:contract (a-arrow OT OT B)
           #:args (list (list "self" #f) (list "other" #f))
           #:return B
           ]

 Checks if this Temporal%(is-offset-time) is before the specified Temporal%(is-offset-time).

 @examples{
  check:
  1 is 1
  end
 }

 @ot-method["minus"
           #:contract (a-arrow OT D OT)
           #:args (list (list "self" #f) (list "amt" #f))
           #:return OT
           ]

 Returns a copy of this OffsetTime with the specified amount subtracted.

 @examples{
  check:
  1 is 1
  end
 }

 @ot-method["minus-seconds"
           #:contract (a-arrow OT N OT)
           #:args (list (list "self" #f) (list "seconds" #f))
           #:return OT
           ]

  Returns a copy of this OffsetTime with the specified number of seconds subtracted.

 @examples{
  check:
  1 is 1
  end
 }

 @ot-method["minus-minutes"
           #:contract (a-arrow OT N OT)
           #:args (list (list "self" #f) (list "minutes" #f))
           #:return OT
           ]

  Returns a copy of this OffsetTime with the specified number of minutes subtracted.

 @examples{
  check:
  1 is 1
  end
 }

  @ot-method["minus-hours"
           #:contract (a-arrow OT N OT)
           #:args (list (list "self" #f) (list "hours" #f))
           #:return OT
           ]

  Returns a copy of this OffsetTime with the specified number of hours subtracted.

 @examples{
  check:
  1 is 1
  end
 }
 
 @ot-method["plus"
           #:contract (a-arrow OT D OT)
           #:args (list (list "self" #f) (list "amt" #f))
           #:return OT
           ]

 Returns a copy of this OffsetTime with the specified amount added.

 @examples{
  check:
  1 is 1
  end
 }

 @ot-method["plus-seconds"
           #:contract (a-arrow OT N OT)
           #:args (list (list "self" #f) (list "seconds" #f))
           #:return OT
           ]

 Returns a copy of this OffsetTime with the specified number of seconds added.

 @examples{
  check:
  1 is 1
  end
 }

@ot-method["plus-minutes"
           #:contract (a-arrow OT N OT)
           #:args (list (list "self" #f) (list "minutes" #f))
           #:return OT
           ]

 Returns a copy of this OffsetTime with the specified number of minutes added.

 @examples{
  check:
  1 is 1
  end
 }

 @ot-method["plus-hours"
           #:contract (a-arrow OT N OT)
           #:args (list (list "self" #f) (list "hours" #f))
           #:return OT
           ]

 Returns a copy of this OffsetTime with the specified number of hours added.

 @examples{
  check:
  1 is 1
  end
 }
 
 @ot-method["to-string"
           #:contract (a-arrow OT S)
           #:args (list (list "self" #f))
           #:return S
           ]

 Outputs this time as a String, such as 10:15:30+00:30.

 @examples{
  check:
  1 is 1
  end
 }

 @ot-method["to-second-of-day"
           #:contract (a-arrow OT N)
           #:args (list (list "self" #f))
           #:return N
           ]

 Extracts the time as seconds of day, from 0 to 24 * 60 * 60 - 1.

 @examples{
  check:
  1 is 1
  end
 }

 @ot-method["until"
           #:contract (a-arrow OT OT D)
           #:args (list (list "self" #f) (list "other" #f))
           #:return D
           ]

 Calculates the normalized duration of time until another OffsetTime.

 @examples{
  check:
  1 is 1
  end
 }

 @ot-method["with-unit"
           #:contract (a-arrow OT TU N OT)
           #:args (list (list "self" #f) (list "unit" #f) (list "val" #f))
           #:return OT
           ]

 Returns a copy of this time with the specified unit set to a new value.

 @examples{
  check:
  1 is 1
  end
 }

  @ot-method["with-second"
           #:contract (a-arrow OT N OT)
           #:args (list (list "self" #f) (list "second" #f))
           #:return OT
           ]

 Returns a copy of this OffsetTime with the seconds altered.

 @examples{
  check:
  1 is 1
  end
 }

 @ot-method["with-minute"
           #:contract (a-arrow OT N OT)
           #:args (list (list "self" #f) (list "minute" #f))
           #:return OT
           ]

 Returns a copy of this OffsetTime with the minutes altered.

 @examples{
  check:
  1 is 1
  end
 }

  @ot-method["with-hour"
           #:contract (a-arrow OT N OT)
           #:args (list (list "self" #f) (list "hour" #f))
           #:return OT
           ]

 Returns a copy of this OffsetTime with the hours altered.

 @examples{
  check:
  1 is 1
  end
 }


 }
}