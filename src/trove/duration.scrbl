#lang scribble/manual
@(require "../../scribble-api.rkt" "../abbrevs.rkt")
@(require (only-in scribble/core delayed-block))

@(define (d-method name #:args args #:return ret #:contract contract)
   (method-doc "Duration" "duration" name #:alt-docstrings "" #:args args #:return ret #:contract contract))

@(append-gen-docs
  `(module "duration"
     (path "src/js/base/runtime-anf.js")
     (data-spec
      (name "Duration")
      (variants ("duration"))
      (shared (
               (method-spec (name "get"))
               (method-spec (name "get-units"))
               (method-spec (name "normalize"))
               (method-spec (name "abs"))
               (method-spec (name "scale"))
               (method-spec (name "scale-f"))
               (method-spec (name "equals"))
               (method-spec (name "any"))
               (method-spec (name "all"))
               (method-spec (name "is-negative"))
               (method-spec (name "is-zero"))
               (method-spec (name "set-unit"))
               (method-spec (name "plus"))
               (method-spec (name "minus"))
               (method-spec (name "times"))
               (method-spec (name "divide"))
               (method-spec (name "to-string"))
               )))
     (fun-spec (name "make-duration"))
     (fun-spec (name "duration"))
     
     (fun-spec (name "ymd-to-duration"))
     (fun-spec (name "hms-to-duration"))
     (fun-spec (name "years-to-duration"))
     (fun-spec (name "months-to-duration"))
     (fun-spec (name "days-to-duration"))
     (fun-spec (name "hours-to-duration"))
     (fun-spec (name "minutes-to-duration"))
     (fun-spec (name "seconds-to-duration"))
     ))

@docmodule["duration"]{

 @ignore[(list "make-duration")]

 @section{The Duration Datatype}

 @data-spec2["Duration" '() (list
                             @constructor-spec["Duration" "duration"
                                               (list `("year" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("month" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("day" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("hour" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("minute" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("second" ("type" "normal") ("contract" ,(a-id "Number"))))])]
 @nested[#:style 'inset]{                  
  The Duration type has several fields, combinations of
  which allow different ways of representing the amounts
  of time this library provides.

  The functions associated with this type include several
  constructors that ensure users need not directly access
  this data type to construct simpler versions of durations
  (i.e. only years, days, or hour-minute-second triples, etc.).

  @margin-note{In conversions and normalization, Duration
   assumes that a "month" duration is equivalent to 30 days
   and a "year" duration is equivalent to 365 days. This is
   done for uniformity, and differences in actual month/year
   lengths are more accurately reflected in the Temporal types.}

  There are no variants for Duration, and programs cannot use
  @pyret{cases} statements with Durations.  Instead, they can be
  created and manipulated with the methods and functions below.
 }

 @section{Duration Methods}

 @d-method["get"
           #:contract (a-arrow D (S-of TU) D)
           #:args (list (list "self" #f) (list "units" #f))
           #:return D
           ]

 Gets the value of the requested Duration from 'units' with 0 for
 the non-requested units (i.e. without normalizing the Duration from 'units').

 @examples{
  check:
    duration(1, 11, 6, -4, 2, -4.5).get([set: unit-month]) is duration(0, 11, 0, 0, 0, 0)
    duration(41.3, 0, 11, 0, 23, 0).get([set: unit-day, unit-year, unit-hour]) is duration(41.3, 0, 0, 0, 0, 0)
  end
 }

 @d-method["get-units"
           #:contract (a-arrow D (S-of TU))
           #:args (list (list "self" #f))
           #:return (S-of TU)
           ]

 Returns a set of non-0 units uniquely defining the value of this Duration.

 @examples{
  check:
    duration(1, 1, 1, 1, 1, 1).get-units()
      is [set: unit-year, unit-month, unit-day, unit-hour, unit-minute, unit-second]
    duration(0, 0, 2, -1.1, -5, 0).get-units()
      is [set: unit-day, unit-hour, unit-minute]
    duration(0, 0, 0, 0, 0, 0).get-units() is empty-set
  end
 }

 @d-method["normalize"
           #:contract (a-arrow D (S-of TU) D)
           #:args (list (list "self" #f) (list "units" #f))
           #:return D
           ]

Normalize the duration into seconds and perform greedy division into a new duration for the 'units' provided.

 @margin-note{A normalized Duration is greedily divided such that its
  year attribute, followed by month attribute, and so on are as large
  as possible, implying that only the units in the set passed may be non-integer,
 and only the value of the smallest unit in the duration may be non-integer}

 @examples{
  check:
    duration(1, 2, 3, 4, 5, 6).normalize([set: unit-year])
      is duration(1, 2, 3, 4, 5, 6)
    duration(1, 12, 30, 24, 60, 60).normalize([set: unit-year, unit-month, unit-day, unit-hour, unit-minute, unit-second])
      is duration(2, 0, 26, 1, 1, 0)
    duration(-1, 2, -3, 4, -5, 6).normalize([set: unit-year, unit-hour, unit-minute, unit-second])
      is ...
      duration(10, 20, 30, 40, 50, 60).normalize([set: unit-year, unit-month, unit-year])
      is duration(11, 8, 12817/480, 0, 0, 0)
  end
 }


 @d-method["abs"
           #:contract (a-arrow D D)
           #:args (list (list "self" #f))
           #:return D
           ]

 Returns a copy of this Duration with all attributes made positive.

 @examples{
  check:
    duration(1, -2, 3, -4, 5, -6).abs()
      is duration(1, 2, 3, 4, 5, 6)
  end
 }

 @d-method["scale-f"
           #:contract (a-arrow D (a-arrow N N) D)
           #:args (list (list "self" #f) (list "f" #f))
           #:return D
           ]

Returns a copy of the Duration scaled by the function 'f'.

 @examples{
  check:
    duration(0, 1, -1, 11/2, -22/7, 0).scale-f(num-round)
      is duration(0, 1, -1, 6, -3, 0)
  end
 }


 @d-method["scale"
           #:contract (a-arrow D N D)
           #:args (list (list "self" #f) (list "coeff" #f))
           #:return D
           ]

 Returns a copy of this Duration scaled by the passed scalar.

 @examples{
  check:
    duration(2, 4, 6, 8, 10, 12).scale(0.5)
      is duration(1, 2, 3, 4, 5, 6)
    duration(2, 4, 6, 8, 10, 12).scale(0)
      is duration(0, 0, 0, 0, 0, 0)
  end
 }

 @d-method["equals"
           #:contract (a-arrow D D B)
           #:args (list (list "self" #f) (list "other" #f))
           #:return B
           ]

 Checks if the normalized forms of this Duration and the specified Duration are equal.

 @examples{
  check:
    duration(1, 20, 39, 2, -1, -90).equals(duration(1, 20, 39, 2, -1, -90))
      is true
    duration(1, 20, 39, 2, -1, -90).equals(duration(2, 9, 4, 1, 57, 30))
      is true
    duration(-1, -2, -3, -4, -5, -6).equals(duration(1, 2, 3, 4, 5, 6))
      is false
  end
 }
@;{
 @d-method["any"
           #:contract (a-arrow D (a-arrow N N) D)
           #:args (list (list "self" #f) (list "f" #f))
           #:return D
           ]

 Checks if 'f' applies to any attribute of Duration.

 @examples{
  check:
    duration(1, 2, -3, 4, 5, -6).any(lam(x): x > 0 end)
      is true
    duration(1, 2, 3, 4, 5, 6).any(lam(x): x < 0 end)
      is false
  end
 }

 @d-method["all"
           #:contract (a-arrow D (a-arrow N N) D)
           #:args (list (list "self" #f) (list "f" #f))
           #:return D
           ]

 Checks if 'f' applies to all attributes of Duration.

 @examples{
  check:
    duration(1, 2, -3, 4, 5, -6).all(lam(x): x > 0 end)
      is false
    duration(1, 2, 3, 4, 5, 6).all(lam(x): x < 0 end)
      is false
    duration(1, 2, 3, 4, 5, 6).all(lam(x): x > 0 end)
      is true
  end
 }
 }

 @d-method["is-negative"
           #:contract (a-arrow D B)
           #:args (list (list "self" #f))
           #:return B
           ]

 Checks if this Duration is negative in its normalized form.

 @examples{
  check:
    duration(1, 2, 3, 4.09, 5, 6).is-negative()
      is false
    duration(-1, 2, -3, 4.09, -5, 6).is-negative()
      is true
    duration(-1, 20, -3, 4.09, -5, 6).is-negative()
      is false
      duration(0, 0, 0, 0, 0, 0).is-negative()
      is false
  end
 }

 @d-method["is-zero"
           #:contract (a-arrow D B)
           #:args (list (list "self" #f))
           #:return B
           ]

 Checks if this Duration is 0 in its normalized form.

 @examples{
  check:
    duration(0, 0, 1, -24, 1, -60).is-zero()
      is true
    duration(0, 0, 0, 0, 0, 0).is-zero()
      is true
    duration(1, 2, 3, 4.09, 5, 6).is-zero()
      is false
  end
 }

 @d-method["set-unit"
           #:contract (a-arrow D TU N D)
           #:args (list (list "self" #f) (list "unit" #f) (list "n" #f))
           #:return D
           ]

 Returns a copy of this Duration with the specified unit modified to 'n'.

 @examples{
  check:
    duration(-1, -2, -3, -4, -5, -6).change-unit(unit-day, 3) end)
      is duration(-1, -2, 3, -4, -5, -6)
  end
 }

 @d-method["plus"
           #:contract (a-arrow D D D)
           #:args (list (list "self" #f) (list "other" #f))
           #:return D
           ]

 Returns a copy of this Duration with the specified Duration added.

 @examples{
  check:
    duration(1, 2, 3, 4, 5, 6).plus(duration(0, 1, -3, 5, 6, -99))
      is duration(1, 3, 0, 9, 11, -93)
  end
 }

 @d-method["minus"
           #:contract (a-arrow D D D)
           #:args (list (list "self" #f) (list "other" #f))
           #:return D
           ]

 Returns a copy of this Duration with the specified Duration subtracted.

 @examples{
  check:
    duration(1, 2, 3, 4, 5, 6).minus(duration(0, 1, 3, 5, 6, 99))
      is duration(1, 1, 0, -1, -1, -93)
  end
 }

  @d-method["times"
           #:contract (a-arrow D D D)
           #:args (list (list "self" #f) (list "other" #f))
           #:return D
           ]

 Returns a copy of this Duration with the specified Duration multiplied.

 @examples{
  check:
    duration(1, 2, 3, 4, 5, 6).times(duration(0, 1, 3, 5, 6, 99))
      is ...
  end
 }


  @d-method["divide"
           #:contract (a-arrow D D D)
           #:args (list (list "self" #f) (list "other" #f))
           #:return D
           ]

 Returns a copy of this Duration with the specified Duration divided.

 @examples{
  check:
    duration(1, 2, 3, 4, 5, 6).divide(duration(0, 1, 3, 5, 6, 99))
      is ...
      duration(1, 2, 3, 4, 5, 6).divide(duration(0, 0, 0, 0, 0, 0))
      raises "division by zero"
  end
 }

 @d-method["to-string"
           #:contract (a-arrow D S)
           #:args (list (list "self" #f))
           #:return S
           ]

 A string representation of this Duration using ISO-8601 seconds based
 representation in normalized form, such as "PT8H6M12.345S".

 @examples{
  check:
    duration(1, 2, 3, 4, 5, 6).to-string()
      is "P1Y2M3DT4H5M6S"
    duration(1, 0, 0, 8, 6, 12.345).to-string()
      is "P1YT8H6M12.345S"
  end
 }

 @section{Duration Functions}

 These functions require the Duration module to be
 @pyret{import}ed, as indicated in the examples.

 @margin-note{The input is not normalized, and is instead stored as is to account
  for computational use cases.}


 @function["ymd-to-duration"
           #:contract (a-arrow N N N D)
           #:args '(("years" #f) ("months" #f) ("days" #f))
           #:return D
           ]{

  Obtains a duration representing an amount from the values of the years, months,
  and days.

  @examples{
   check:
     ymd-to-duration(-4, -10, -21)
       is duration(-4, -10, -21, 0, 0, 0)
   end
  }
 }

 @function["hms-to-duration"
           #:contract (a-arrow N N N D)
           #:args '(("hours" #f) ("minutes" #f) ("seconds" #f))
           #:return D
           ]{

  Obtains a duration representing an amount from the values of the hours, minutes,
  and seconds.

  @examples{
   check:
     hms-to-duration(-5, -3, -11)
       is duration(0, 0, 0, -5, -3, -11)
   end
  }
 }

 @function["years-to-duration"
           #:contract (a-arrow N D)
           #:args '(("years" #f))
           #:return D
           ]{

  Obtains a Duration representing a number of years.

  @examples{
   check:
     years-to-duration(1)
       is duration(1, 0, 0, 0, 0, 0)
   end
  }
 }

 @function["months-to-duration"
           #:contract (a-arrow N D)
           #:args '(("months" #f))
           #:return D
           ]{

  Obtains a Duration representing a number of months.

  @examples{
   check:
     months-to-duration(1)
       is duration(0, 1, 0, 0, 0, 0)
   end
  }
 }

 @function["days-to-duration"
           #:contract (a-arrow N D)
           #:args '(("days" #f))
           #:return D
           ]{

  Obtains a Duration representing a number of days.

  @examples{
   check:
     days-to-duration(1)
       is duration(0, 0, 1, 0, 0, 0)
   end
  }
 }

 @function["hours-to-duration"
           #:contract (a-arrow N D)
           #:args '(("hour" #f))
           #:return D
           ]{

  Obtains a Duration representing a number of hours.

  @examples{
   check:
     hours-to-duration(1)
       is duration(0, 0, 0, 1, 0, 0)
   end
  }
 }

 @function["minutes-to-duration"
           #:contract (a-arrow N D)
           #:args '(("years" #f))
           #:return D
           ]{

  Obtains a Duration representing a number of minutes.

  @examples{
   check:
     minutes-to-duration(1)
       is duration(0, 0, 0, 0, 1, 0)
   end
  }
 }

 @function["seconds-to-duration"
           #:contract (a-arrow N D)
           #:args '(("seconds" #f))
           #:return D
           ]{

  Obtains a Duration representing a number of seconds.

  @examples{
   check:
     seconds-to-duration(1)
       is duration(0, 0, 0, 0, 0, 1)
   end
  }
 }
            
}