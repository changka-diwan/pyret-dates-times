#lang scribble/manual
@(require "../../scribble-api.rkt" "../abbrevs.rkt")
@(require (only-in scribble/core delayed-block))

@(define (odt-method name #:args args #:return ret #:contract contract)
   (method-doc "OffsetDateTime" "offset-date-time" name #:alt-docstrings "" #:args args #:return ret #:contract contract))

@(append-gen-docs
  `(module "offset-date-time"
     (path "src/js/base/runtime-anf.js")
     (data-spec
      (name "OffsetDateTime")
      (variants ("offset-date-time"))
      (shared (
               (method-spec (name "at-naive"))
               (method-spec (name "at-utc"))
               (method-spec (name "at-offset-same-utc"))
               (method-spec (name "at-offset-same-naive"))
               (method-spec (name "at-zone-same-utc"))
               (method-spec (name "at-zone-same-naive"))
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
     
     (fun-spec (name "string-to-offset-date-time"))
     ))

@docmodule["offset-date-time"]{

 @ignore[(list "make-offset-date-time")]

   @section{The OffsetDateTime Type}

 type OffsetDateTime = Temporal%(is-offset-date-time)
 
 @nested[#:style 'inset]{                  
  OffsetDateTime info...

  OffsetDateTime must always be valid, where a valid OffsetDateTime has rational seconds within [0, 60),
  integer minutes within [0, 60), integer hours within [0, 24), days between 1 (inclusive) and the valid number of days
  for the appropriate month of the appropriate year, integer months within [0, 12], and whole number year
 

  @margin-note{An OffsetDateTime must also have a valid OffsetDate following the validity rules described in the OffsetDate Section
 }
 }

 @section{OffsetDateTime Methods}

 @odt-method["at-naive"
            #:contract (a-arrow ODT ODT)
            #:args (list (list "self" #f))
            #:return ODT
            ]

Extracts the date time and converts into a NaiveDateTime.

 @examples{
  check:
  1 is 1
  end
 }

 @odt-method["at-utc"
           #:contract (a-arrow ODT UDT)
           #:args (list (list "self" #f))
           #:return UDT
           ]

 Converts the date time into that at UTC.

 @examples{
  check:
  1 is 1
  end
 }

  @odt-method["at-offset-same-utc"
           #:contract (a-arrow ODT ZO ODT)
           #:args (list (list "self" #f) (list "offset" #f))
           #:return ODT
           ]

 Combines this date-time with an offset to create an OffsetDateTime ensuring that the result has the same UTCDateTime.

 @examples{
  check:
  1 is 1
  end
 }


 @odt-method["at-offset-same-naive"
           #:contract (a-arrow ODT ZO NT)
           #:args (list (list "self" #f) (list "offset" #f))
           #:return NT
           ]

 Combines this date-time with an offset to create an OffsetDateTime trying to keep the same naive date and time.

 @examples{
  check:
  1 is 1
  end
 }

 @odt-method["at-zone-same-utc"
           #:contract (a-arrow ODT ZI ODT)
           #:args (list (list "self" #f) (list "zone" #f))
           #:return ODT
           ]

 Combines this date-time with a time-zone to create a ZonedDateTime ensuring that the result has the same UTCDateTime.

 @examples{
  check:
  1 is 1
  end
 }


 @odt-method["at-zone-same-naive"
           #:contract (a-arrow ODT ZI NT)
           #:args (list (list "self" #f) (list "zone" #f))
           #:return NT
           ]

 Combines this date-time with a time-zone to create a ZonedDateTime trying to keep the same naive date and time.

 @examples{
  check:
  1 is 1
  end
 }

 @odt-method["get-naive-date"
           #:contract (a-arrow ODT ND)
           #:args (list (list "self" #f))
           #:return ND
           ]

 Gets the NaiveDate from the date time.

 @examples{
  check:
  1 is 1
  end
 }


 @odt-method["get-naive-time"
           #:contract (a-arrow ODT NT)
           #:args (list (list "self" #f))
           #:return NT
           ]

 Gets the NaiveTime from the date time.

 @examples{
  check:
  1 is 1
  end
 }

@odt-method["compare"
           #:contract (a-arrow ODT ODT N)
           #:args (list (list "self" #f) (list "other" #f))
           #:return N
           ]

Returns 1 if this OffsetDateTime is before the other, 0 if both contain the same date-time, -1 if the other is before this OffsetDateTime.

 @examples{
  check:
  1 is 1
  end
 }

 @odt-method["is-leap-year"
           #:contract (a-arrow ODT B)
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
 
 @odt-method["plus"
           #:contract (a-arrow ODT D ODT)
           #:args (list (list "self" #f) (list "amt" #f))
           #:return ODT
           ]

 Returns a copy of this OffsetDateTime with the specified amount added.

 @examples{
  check:
  1 is 1
  end
 }

  @odt-method["plus-weeks"
           #:contract (a-arrow ODT N ODT)
           #:args (list (list "self" #f) (list "weeks" #f))
           #:return ODT
           ]

Returns a copy of this temporal with the specified number of weeks added."

 @examples{
  check:
  1 is 1
  end
 }

 @odt-method["minus"
           #:contract (a-arrow ODT D ODT)
           #:args (list (list "self" #f) (list "amt" #f))
           #:return ODT
           ]

 Returns a copy of this OffsetDateTime with the specified amount subtracted.

 @examples{
  check:
  1 is 1
  end
 }

  @odt-method["minus-weeks"
           #:contract (a-arrow ODT N ODT)
           #:args (list (list "self" #f) (list "weeks" #f))
           #:return ODT
           ]

Returns a copy of this temporal with the specified number of weeks subtracted."

 @examples{
  check:
  1 is 1
  end
 }

 @odt-method["until"
           #:contract (a-arrow ODT ODT D)
           #:args (list (list "self" #f) (list "other" #f))
           #:return D
           ]

 Calculates the duration of time until another OffsetDateTime.

 @examples{
  check:
  1 is 1
  end
 }

  @odt-method["to-string"
           #:contract (a-arrow ODT S)
           #:args (list (list "self" #f))
           #:return S
           ]

Outputs this date-time as a String, such as 2007-12-03T10:15:30.


 @examples{
  check:
  1 is 1
  end
 }

 @odt-method["set-unit"
           #:contract (a-arrow ODT TU N ODT)
           #:args (list (list "self" #f) (list "unit" #f) (list "val" #f))
           #:return ODT
           ]

 Returns a copy of this OffsetDateTime with the specified unit set to a new value.

 @margin-note{The OffsetDateTime is also normalized internally so that even if a negative or 'invalid' value
              (such as 31 days in February) is passed, a valid, equivalent OffsetDateTime will be returned
 }


 @examples{
  check:
  1 is 1
  end
 }

  @section{OffsetDateTime Functions}


 @function["string-to-offset-date-time"
           #:contract (a-arrow S ODT)
           #:args '(("text" #f))
           #:return ODT
           ]{

  Obtains an instance of OffsetDateTime from a text string such as '2007-12-03T10:15:30+05:00'.

  @examples{
   check:
   1 is 1
   end
  }
 }

}
