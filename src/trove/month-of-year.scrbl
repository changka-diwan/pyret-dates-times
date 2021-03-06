#lang scribble/manual
@(require "../../scribble-api.rkt" "../abbrevs.rkt")
@(require (only-in scribble/core delayed-block))

@(define (moy-method name #:args args #:return ret #:contract contract)
   (method-doc "MonthOfYear" "month-of-year" name #:alt-docstrings "" #:args args #:return ret #:contract contract))

@(append-gen-docs
  `(module "month-of-year"
     (path "src/js/base/runtime-anf.js")
     (data-spec
      (name "MonthOfYear")
      (variants ("m1" "m2" "m3" "m4" "m5" "m6" "m7" "m8" "m9" "m10" "m11" "m12"))
      (shared (
               (method-spec (name "get-display-name"))
               (method-spec (name "get-num"))
               (method-spec (name "length"))
               (method-spec (name "arithmetic-f"))
               (method-spec (name "subtract"))
               (method-spec (name "between"))
               (method-spec (name "add"))
               )))
     (fun-spec (name "make-month-of-year"))
     (fun-spec (name "month-of-year"))
     
     (fun-spec (name "num-to-month"))
     (fun-spec (name "string-to-month"))
     ))

@docmodule["month-of-year"]{

 @ignore[(list "make-month-of-year")]

 @section{The MonthOfYear Datatype}

 @data-spec2["MonthOfYear" '() (list
                             @singleton-spec2["MonthOfYear" "m1"]
                             @singleton-spec2["MonthOfYear" "m2"]
                             @singleton-spec2["MonthOfYear" "m3"]
                             @singleton-spec2["MonthOfYear" "m4"]
                             @singleton-spec2["MonthOfYear" "m5"]
                             @singleton-spec2["MonthOfYear" "m6"]
                             @singleton-spec2["MonthOfYear" "m7"]
                             @singleton-spec2["MonthOfYear" "m8"]
                             @singleton-spec2["MonthOfYear" "m9"]
                             @singleton-spec2["MonthOfYear" "m10"]
                             @singleton-spec2["MonthOfYear" "m11"]
                             @singleton-spec2["MonthOfYear" "m12"]
                             )]
 @nested[#:style 'inset]{                  
 The MonthOfYear represents the possible months of the standard Gregorian calendar.

  The e-nums 1 through 12 happen to coincide with the conventional order of months
  in the Gregorian Calendar, where 1 represents January, 2 represents
  February, and so on.
  
  These twelve variables for MonthOfYear may be
  created and manipulated with the methods and functions below.
 }

 @section{MonthOfYear Methods}

 @moy-method["get-display-name"
           #:contract (a-arrow MoY S)
           #:args (list (list "self" #f))
           #:return S
           ]

 Gets the textual representation in the Gregorian Calendar,
 such as 'January' or 'December'.

 @examples{
  check:
    m8.get-display-name() is "August"
  end
 }

  @moy-method["get-num"
           #:contract (a-arrow MoY N)
           #:args (list (list "self" #f))
           #:return N
           ]

Gets the MonthOfYear Number value following the Gregorian
 Calendar Convention

 @examples{
  check:
    m2.get-num() is 2
  end
 }

  @moy-method["length"
           #:contract (a-arrow MoY B N)
           #:args (list (list "self" #f) (list "is-leap-year" #f))
           #:return N
           ]

Gets the length of this month in days.

 @examples{
  check:
    m5.length(true) is 31
    m5.length(false) is 31
    m2.length(true) is 29
    m2.length(false) is 28
  end
 }



  @moy-method["arithmetic-f"
           #:contract (a-arrow MoY (a-arrow N N) MoY)
           #:args (list (list "self" #f) (list "f" #f))
           #:return MoY
           ]

Returns the MonthOfYear after modifying the given MonthOfYear through 'f'.

 @examples{
  check:
    m7.arithmetic-f(lam(x): x * -5 end) is m1
  end
 }

 @moy-method["subtract"
           #:contract (a-arrow MoY MoY N)
           #:args (list (list "self" #f) (list "months" #f))
           #:return N
           ]

Returns the MonthOfYear that is the specified number of months before this one.

 @examples{
  check:
     m1.minus(20) is m5
  end
 }

  @moy-method["between"
           #:contract (a-arrow MoY N MoY)
           #:args (list (list "self" #f) (list "other" #f))
           #:return MoY
           ]

Returns the number of months between the specified months

 @examples{
  check:
     m1.between(m5) is 4
     m5.between(m1) is 4
  end
 }

 @moy-method["add"
           #:contract (a-arrow MoY N MoY)
           #:args (list (list "self" #f) (list "months" #f))
           #:return MoY
           ]

Returns the MonthOfYear that is the specified number of months after this one.

 @examples{
  check:
    m1.plus(20) is m9
  end
 }

 @section{MonthOfYear Functions}

 These functions require the MonthOfYear module to be
 @pyret{import}ed, as indicated in the examples.

 @function["num-to-month"
           #:contract (a-arrow N MoY)
           #:args '(("n" #f))
           #:return MoY
           ]{

  Obtains an instance of MonthOfYear from a Number value.

  @examples{
   check:
     num-to-month(3) is m3
     num-to-month(-39) is m9
     num-to-month(22/7)
       raises "Can only create MonthOfYear from Natural Numbers" 
   end
  }
 }

 @function["string-to-month"
           #:contract (a-arrow S MoY)
           #:args '(("text" #f))
           #:return MoY
           ]{

  Returns the MonthOfYear from the specified name
  in trade week respresentation.

  @examples{
   check:
     string-to-month("junE") is m6
     string-to-month("JAN")
       raises "Please enter the month in full Gregorian form eg January"
   end
  }
 }
            
}