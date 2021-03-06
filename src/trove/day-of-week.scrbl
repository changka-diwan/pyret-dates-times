#lang scribble/manual
@(require "../../scribble-api.rkt" "../abbrevs.rkt")
@(require (only-in scribble/core delayed-block))

@(define (dow-method name #:args args #:return ret #:contract contract)
   (method-doc "DayOfWeek" "day-of-week" name #:alt-docstrings "" #:args args #:return ret #:contract contract))

@(append-gen-docs
  `(module "day-of-week"
     (path "src/js/base/runtime-anf.js")
     (data-spec
      (name "DayOfWeek")
      (variants ("d1" "d2" "d3" "d4" "d5" "d6" "d7"))
      (shared (
               (method-spec (name "get-display-name"))
               (method-spec (name "get-num"))
               (method-spec (name "arithmetic-f"))
               (method-spec (name "subtract"))
               (method-spec (name "between"))
               (method-spec (name "add"))
               )))
     (fun-spec (name "make-day-of-week"))
     (fun-spec (name "day-of-week"))
     
     (fun-spec (name "num-to-day"))
     (fun-spec (name "string-to-day"))
     ))

@docmodule["day-of-week"]{

 @ignore[(list "make-day-of-week")]

 @section{The DayOfWeek Datatype}

 @data-spec2["DayOfWeek" '() (list
                             @singleton-spec2["DayOfWeek" "d1"]
                             @singleton-spec2["DayOfWeek" "d2"]
                             @singleton-spec2["DayOfWeek" "d3"]
                             @singleton-spec2["DayOfWeek" "d4"]
                             @singleton-spec2["DayOfWeek" "d5"]
                             @singleton-spec2["DayOfWeek" "d6"]
                             @singleton-spec2["DayOfWeek" "d7"]
                             )]
 @nested[#:style 'inset]{                  
 The DayOfWeek represents the possible days of the standard business week.

  The e-nums 1 through 7 happen to coincide with the trade convention
  for weeks in the Gragorian Calendar, where 1 represents Monday, 2 represents
  Tuesday, and so on.
  
  These seven variables for DayOfWeek may be
  created and manipulated with the methods and functions below.
 }

 @section{DayOfWeek Methods}

 @dow-method["get-display-name"
           #:contract (a-arrow DoW S)
           #:args (list (list "self" #f))
           #:return S
           ]

 Gets the textual representation following the trade representation
 of the week such as 'Monday' or 'Friday'.

 @examples{
  check:
    d5.get-display-name() is "Friday"
  end
 }

  @dow-method["get-num"
           #:contract (a-arrow DoW N)
           #:args (list (list "self" #f))
           #:return N
           ]

Gets the day-of-week Number value following the
 trade week representation.

 @examples{
  check:
    d3.get-value() is 3
  end
 }

  @dow-method["arithmetic-f"
           #:contract (a-arrow DoW (a-arrow N N) DoW)
           #:args (list (list "self" #f) (list "f" #f))
           #:return DoW
           ]

Returns the DayOfWeek after modifying the given DayOfWeek through 'f'.

 @examples{
  check:
    d6.change(lam(x): x * -3 end) is d3
  end
 }

 @dow-method["subtract"
           #:contract (a-arrow DoW N DoW)
           #:args (list (list "self" #f) (list "days" #f))
           #:return DoW
           ]

Returns the DayOfWeek that is the specified number of days before this one.

 @examples{
  check:
    d1.subtract(10) is d5
  end
 }

  @dow-method["between"
           #:contract (a-arrow DoW DoW N)
           #:args (list (list "self" #f) (list "other" #f))
           #:return N
           ]

Returns the number of days between the two given Days.

 @examples{
  check:
    d1.between(d3) is 2
    d3.between(d1) is 2
  end
 }

 @dow-method["add"
           #:contract (a-arrow DoW N DoW)
           #:args (list (list "self" #f) (list "days" #f))
           #:return DoW
           ]

Returns the DayOfWeek that is the specified number of days after this one.

 @examples{
  check:
    d1.add(10) is d4
  end
 }

 @section{DayOfWeek Functions}

 @function["num-to-day"
           #:contract (a-arrow N DoW)
           #:args '(("n" #f))
           #:return DoW
           ]{

  Obtains an instance of DayOfWeek from a Number value.

  @examples{
   check:
     num-to-day(3) is d3
     num-to-day(-12) is d2
     num-to-day(22/7)
       raises "Can only create DayOfWeek from Natural Numbers" 
   end
  }
 }

 @function["string-to-day"
           #:contract (a-arrow S DoW)
           #:args '(("text" #f))
           #:return DoW
           ]{

  Returns the DayOfWeek from the specified name
  in trade week respresentation.

  @examples{
   check:
     string-to-day("THUrsDaY") is d4
     string-to-day("mon")
       raises "Please enter the day in full trade form eg 'Monday'"
   end
  }
 }
            
}