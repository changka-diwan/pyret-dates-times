#lang scribble/manual
@(require "../../scribble-api.rkt" "../abbrevs.rkt")
@(require (only-in scribble/core delayed-block))

@(define (udt-method name #:args args #:return ret #:contract contract)
   (method-doc "UTCDateTime" "utc-date-time" name #:alt-docstrings "" #:args args #:return ret #:contract contract))

@(append-gen-docs
  `(module "utc-date-time"
     (path "src/js/base/runtime-anf.js")
     (data-spec
      (name "UTCDateTime")
      (variants ("utc-date-time"))
      (shared (
               (method-spec (name "at-offset"))
               (method-spec (name "at-zone"))
               (method-spec (name "get-naive-date"))
               (method-spec (name "get-naive-time"))
               (method-spec (name "compare"))
               (method-spec (name "is-leap-year"))
               (method-spec (name "minus"))
               (method-spec (name "minus-weeks"))
               (method-spec (name "plus"))
               (method-spec (name "plus-weeks"))
               (method-spec (name "until"))
               (method-spect(name "to-string"))
               (method-spec (name "set-unit"))
               )))
     
     (fun-spec (name "string-to-utc-date-time"))
     ))

@docmodule["utc-date-time"]{

 @ignore[(list "make-utc-date-time")]

   @section{The UTCDateTime Type}

 type UTCDateTime = Temporal%(is-utc-date-time)
 
 @nested[#:style 'inset]{                  
  UTCDateTime info...

  UTCDateTime must always be valid, where a valid UTCDateTime has rational seconds within [0, 60),
  integer minutes within [0, 60), integer hours within [0, 24), days between 1 (inclusive) and the valid number of days
  for the appropriate month of the appropriate year, integer months within [0, 12], and whole number year
 
 }

 @section{UTCDateTime Methods}

 @udt-method["at-offset"
            #:contract (a-arrow UDT ZO ODT)
            #:args (list (list "self" #f) (list "date" #f))
            #:return ODT
            ]

Combines this date-time with an offset to create an OffsetDateTime.

 @examples{
  check:
  1 is 1
  end
 }

 @udt-method["at-zone"
           #:contract (a-arrow UDT ZI ZDT)
           #:args (list (list "self" #f) (list "offset" #f))
           #:return UDT
           ]

 Combines this date-time with a time-zone to create a ZonedDateTime.

 @examples{
  check:
  1 is 1
  end
 }

  @udt-method["get-naive-date"
           #:contract (a-arrow UDT ND)
           #:args (list (list "self" #f))
           #:return ND
           ]

 Gets the NaiveDate from the date time.

 @examples{
  check:
  1 is 1
  end
 }


 @udt-method["get-naive-time"
           #:contract (a-arrow UDT NT)
           #:args (list (list "self" #f))
           #:return NT
           ]

 Gets the NaiveTime from the date time.

 @examples{
  check:
  1 is 1
  end
 }

@udt-method["compare"
           #:contract (a-arrow UDT UDT N)
           #:args (list (list "self" #f) (list "other" #f))
           #:return N
           ]

Returns 1 if this UTCDateTime is before the other, 0 if both contain the same date-time, -1 if the other is before this UTCDateTime.

 @examples{
  check:
  1 is 1
  end
 }

 @udt-method["is-leap-year"
           #:contract (a-arrow UDT B)
           #:args (list (list "self" #f))
           #:return B
           ]

Checks if the year is a leap year, according to 
            the ISO proleptic calendar system rules.
 
 @examples{
  check:
  1 is 1
  end
 }
 
 @udt-method["plus"
           #:contract (a-arrow UDT D UDT)
           #:args (list (list "self" #f) (list "amt" #f))
           #:return UDT
           ]

 Returns a copy of this UTCDateTime with the specified amount added.

 @examples{
  check:
  1 is 1
  end
 }

  @udt-method["plus-weeks"
           #:contract (a-arrow UDT N UDT)
           #:args (list (list "self" #f) (list "weeks" #f))
           #:return UDT
           ]

Returns a copy of this temporal with the specified number of weeks added."

 @examples{
  check:
  1 is 1
  end
 }

 @udt-method["minus"
           #:contract (a-arrow UDT D UDT)
           #:args (list (list "self" #f) (list "amt" #f))
           #:return UDT
           ]

 Returns a copy of this UTCDateTime with the specified amount subtracted.

 @examples{
  check:
  1 is 1
  end
 }

  @udt-method["minus-weeks"
           #:contract (a-arrow UDT N UDT)
           #:args (list (list "self" #f) (list "weeks" #f))
           #:return UDT
           ]

Returns a copy of this temporal with the specified number of weeks subtracted."

 @examples{
  check:
  1 is 1
  end
 }

 @udt-method["until"
           #:contract (a-arrow UDT UDT D)
           #:args (list (list "self" #f) (list "other" #f))
           #:return D
           ]

 Calculates the duration of time until another UTCDateTime.

 @examples{
  check:
  1 is 1
  end
 }

  @udt-method["to-string"
           #:contract (a-arrow UDT S)
           #:args (list (list "self" #f))
           #:return S
           ]

Outputs this date-time as a String, such as 2007-12-03T10:15:30.


 @examples{
  check:
  1 is 1
  end
 }

 @udt-method["set-unit"
           #:contract (a-arrow UDT TU N UDT)
           #:args (list (list "self" #f) (list "unit" #f) (list "val" #f))
           #:return UDT
           ]

 Returns a copy of this UTCDateTime with the specified unit set to a new value.

 @margin-note{The UTCDateTime is also normalized internally so that even if a negative or 'invalid' value
              (such as 31 days in February) is passed, a valid, equivalent UTCDateTime will be returned
 }


 @examples{
  check:
  1 is 1
  end
 }

 @section{UTCDateTime Functions}


 @function["string-to-utc-date-time"
           #:contract (a-arrow S UDT)
           #:args '(("text" #f))
           #:return UDT
           ]{

  Obtains an instance of UTCDateTime from a text string such as '2007-12-03T10:15:30'.

  @examples{
   check:
   1 is 1
   end
  }
 }

  

}

