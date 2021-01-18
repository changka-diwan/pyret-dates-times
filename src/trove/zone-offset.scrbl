#lang scribble/manual
@(require "../../scribble-api.rkt" "../abbrevs.rkt")
@(require (only-in scribble/core delayed-block))

@(define (zo-method name #:args args #:return ret #:contract contract)
   (method-doc "ZoneOffset" "zone-offset" name #:alt-docstrings "" #:args args #:return ret #:contract contract))

@(append-gen-docs
  `(module "zone-offset"
     (path "src/js/base/runtime-anf.js")
     (data-spec
      (name "ZoneOffset")
      (variants ("zone-offset"))
      (shared (
               (method-spec (name "difference"))
               (method-spec (name "to-second"))
               (method-spec (name "to-string"))
               )))
     (fun-spec (name "make-zone-offset"))
     (fun-spec (name "zone-offset"))
     
     (fun-spec (name "string-to-zone-offset"))
     (fun-spec (name "id-to-zone-offset"))
     (fun-spec (name "hours-to-zone-offset"))
     ))

@docmodule["zone-offset"]{

 @ignore[(list "make-zone-offset")]

 @section{The ZoneOffset Datatype}

 @data-spec2["ZoneOffset" '() (list
                             @constructor-spec["ZoneOffset" "zone-offset"
                                               (list `("hours" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     `("minutes" ("type" "normal") ("contract" ,(a-id "Number")))
                                                     )])]
 @nested[#:style 'inset]{                  
 The ZoneOffset stores the interval between two durations in the form of a time-zone offset.

  In effect, a ZoneOffset of (0, 0) represents UTC or GMT, (-5, 0) represents EST, ()and so on.
 }

 @section{ZoneOffset Methods}

 @zo-method["difference"
           #:contract (a-arrow ZO ZO D)
           #:args (list (list "self" #f) (list "other" #f))
           #:return D
           ]

 Finds the difference between two ZoneOffsets as a Duration.

 @examples{
  check:
    zone-offset(10, 30).difference(zone-offset(8, 0))
      is duration(0, 0, 0, 2, 30, 0)
    zone-offset(10, 30).difference(zone-offset(13, 15))
      is duration(0, 0, 0, -23, -45, 0)
  end
 }



 @zo-method["to-second"
           #:contract (a-arrow ZO N)
           #:args (list (list "self" #f))
           #:return N
           ]

Gets the total ZoneOffset in seconds.

 @examples{
  check:
    zone-offset(10, 45).to-second()
      is (((10 * 60) + 45) * 60)
  end
 }

 @zo-method["to-string"
           #:contract (a-arrow ZO S)
           #:args (list (list "self" #f))
           #:return S
           ]

 Outputs this ZoneOffset as a String, using an '+18:00' format.

 @examples{
  check:
    zone-offset(-8, -30).to-string() is "-08:30"
    zone-offset(5, 0).to-string() is "+05:00"
  end
 }

 @section{ZoneOffset Functions}

 @function["string-to-zone-offset"
           #:contract (a-arrow N ZO)
           #:args '(("n" #f))
           #:return ZO
           ]{

  Obtains an instance of ZoneOffset using a string representation.

  @examples{
   check:
     offset-to-zone-offset("-1:59") is zone-offset(-1, -59)
     offset-to-zone-offset("+-8:-60") is ...
     offset-to-zone-offset("811")
       raises "ZoneOffset text did not have a sign"
     offset-to-zone-offset("8:11")
       raises "ZoneOffset text did not have a sign"
     offset-to-zone-offset("+811")
       raises "ZoneOffset text input must be in the form '+18:00'"
     offset-to-zone-offset("+a:b")
       raises "ZoneOffset text must have a number for hours"
     offset-to-zone-offset("+0:b")
       raises "ZoneOffset text must have a number for minutes"
   end
  }
 }

 @function["id-to-zone-offset"
           #:contract (a-arrow N ZO)
           #:args '(("n" #f))
           #:return ZO
           ]{

  Obtains an instance of ZoneOffset using the ZoneId.

  @examples{
   check:
     id-to-zone-offset(GMT)
       is zone-offset("+", 0, 0)
     id-to-zone-offset(IST)
       is zone-offset("+", 5, 30)
   end
  }
 }

 @function["hours-to-zone-offset"
           #:contract (a-arrow N ZO)
           #:args '(("n" #f))
           #:return ZO
           ]{

  Obtains an instance of ZoneOffset using hours.

  @examples{
   check:
     hours-to-zone-offset(-7)
       is zone-offset("-", 7, 0)
   end
  }
 }

            
}