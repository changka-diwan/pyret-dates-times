#lang scribble/manual
@(require "../../scribble-api.rkt" "../abbrevs.rkt")
@(require (only-in scribble/core delayed-block))

@(define (nt-method name #:args args #:return ret #:contract contract)
   (method-doc "NaiveTime" "naive-time" name #:alt-docstrings "" #:args args #:return ret #:contract contract))

@(append-gen-docs
  `(module "naive-time"
     (path "src/js/base/runtime-anf.js")
     (data-spec
      (name "NaiveTime")
      (variants ("naive-time"))
      (shared (
               (method-spec (name "at-date"))
               (method-spec (name "at-offset"))
               (method-spec (name "get-second"))
               (method-spec (name "get-minute"))
               (method-spec (name "get-hour"))
               (method-spec (name "is-after"))
               (method-spec (name "is-before"))
               (method-spec (name "minus"))
               (method-spec (name "minus-seconds"))
               (method-spec (name "minus-minutes"))
               (method-spec (name "minus-hours"))
               (method-spec (name "plus"))
               (method-spec (name "plus-seconds"))
               (method-spec (name "plus-minutes"))
               (method-spec (name "plus-hours"))
               (method-spect(name "to-string"))
               (method-spec (name "to-second-of-day"))
               (method-spec (name "until"))
               (method-spec (name "with-unit"))
               (method-spec (name "with-second"))
               (method-spec (name "with-minute"))
               (method-spec (name "with-hour"))
               )))
     (fun-spec (name "naive-time-of-any"))
     (fun-spec (name "naive-time-now"))
     (fun-spec (name "naive-time-from-zone-now"))
     (fun-spec (name "parse-naive-time"))
     ))

@docmodule["naive-time"]{

 @ignore[(list "make-naive-time")]

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

}