#lang scribble/manual
@(require "../../scribble-api.rkt" "../abbrevs.rkt")
@(require (only-in scribble/core delayed-block))

@(define (zi-method name #:args args #:return ret #:contract contract)
   (method-doc "ZoneId" "zone-id" name #:alt-docstrings "" #:args args #:return ret #:contract contract))

@(append-gen-docs
  `(module "zone-id"
     (path "src/js/base/runtime-anf.js")
     (data-spec
      (name "ZoneId")
      (variants ("zone-id"))
      (shared (
               (method-spec (name "equals"))
               (method-spec (name "get-zone-offset"))
               (method-spec (name "to-string"))
               )))
     (fun-spec (name "make-zone-id"))
     (fun-spec (name "zone-id"))
     
     (fun-spec (name "zone-id-of-text"))
     (fun-spec (name "system-default-zone-id"))
     ))

@docmodule["zone-id"]{

 @ignore[(list "make-zone-id")]

 @section{The ZoneId Datatype}

 @data-spec2["ZoneId" '() (list
                             @singleton-spec2["ZoneId" "LINT"]
                             @singleton-spec2["ZoneId" "CHADT"]
                             @singleton-spec2["ZoneId" "NST"]
                             @singleton-spec2["ZoneId" "SST"]
                             @singleton-spec2["ZoneId" "ACDT"]
                             @singleton-spec2["ZoneId" "AET"]
                             @singleton-spec2["ZoneId" "ACT"]
                             @singleton-spec2["ZoneId" "JST"]
                             @singleton-spec2["ZoneId" "ACWST"]
                             @singleton-spec2["ZoneId" "CTT"]
                             @singleton-spec2["ZoneId" "VST"]
                             @singleton-spec2["ZoneId" "MMT"]
                             @singleton-spec2["ZoneId" "BST"]
                             @singleton-spec2["ZoneId" "NPT"]
                             @singleton-spec2["ZoneId" "IST"]
                             @singleton-spec2["ZoneId" "PLT"]
                             @singleton-spec2["ZoneId" "NET"]
                             @singleton-spec2["ZoneId" "MET"]
                             @singleton-spec2["ZoneId" "EAT"]
                             @singleton-spec2["ZoneId" "ART"]
                             @singleton-spec2["ZoneId" "EET"]
                             @singleton-spec2["ZoneId" "ECT"]
                             @singleton-spec2["ZoneId" "UTC"]
                             @singleton-spec2["ZoneId" "GMT"]
                             @singleton-spec2["ZoneId" "CAT"]
                             @singleton-spec2["ZoneId" "GST"]
                             @singleton-spec2["ZoneId" "BET"]
                             @singleton-spec2["ZoneId" "AGT"]
                             @singleton-spec2["ZoneId" "CNT"]
                             @singleton-spec2["ZoneId" "PRT"]
                             @singleton-spec2["ZoneId" "EST"]
                             @singleton-spec2["ZoneId" "CST"]
                             @singleton-spec2["ZoneId" "MST"]
                             @singleton-spec2["ZoneId" "PNT"]
                             @singleton-spec2["ZoneId" "PST"]
                             @singleton-spec2["ZoneId" "AST"]
                             @singleton-spec2["ZoneId" "MART"]
                             @singleton-spec2["ZoneId" "HST"]
                             @singleton-spec2["ZoneId" "MIT"]
                             @singleton-spec2["ZoneId" "AoE"]
                             )]
 @nested[#:style 'inset]{                  
  The ZoneId stores the Time-Zone codes of all ZoneOffsets around the world.
  
  Each code is mapped to a specific offset in a key-value pair dictionary to allow
  conversion of data between Zoned Temporal objects and Offset Temporal objects.

  If multiple Time-Zone codes exist for a ZoneOffset, there may be only one Time-Zone
  code associated. For instance, PLT is supported for +5:00 but not UZT
 }

 @section{ZoneId Methods}

 @zi-method["equals"
           #:contract (a-arrow ZI ZI B)
           #:args (list (list "self" #f) (list "other" #f))
           #:return B
           ]

 Checks if this ZoneId is equal to another ZoneId.

 @examples{
  check:
    EST.equals(EST) is true
    EST.equals(IST) is false
  end
 }

 @zi-method["get-zone-offset"
           #:contract (a-arrow ZI ZO)
           #:args (list (list "self" #f))
           #:return ZO
           ]

 Gets the ZoneOffset of the ZoneId.

 @examples{
  check:
    IST.get-zone-offset()
      is zone-offset("+", 5, 30)
    UTC.get-zone-offset()
      is zone-offset("+", 0, 0)
  end
 }

 @zi-method["to-string"
           #:contract (a-arrow ZI S)
           #:args (list (list "self" #f))
           #:return S
           ]

 Outputs this ZoneId as a String.

 @examples{
  check:
    IST.to-string() is "IST"
    EST.to-string() is "EST"
  end
 }
 
 @section{Duration Functions}

 These functions require the ZoneId module to be
 @pyret{import}ed, as indicated in the examples.

 @function["zone-id-of-text"
           #:contract (a-arrow N ZI)
           #:args '(("n" #f))
           #:return ZI
           ]{

  Obtains an instance of ZoneId from a String ensuring
  that the ZoneId is supported.

  @examples{
   check:
     zone-id-of-text("IST") is IST
     zone-id-of-text("EST") is EST
   end
  }
 }

 @function["system-default-zone-id"
           #:contract (a-arrow N ZI)
           #:args '(("n" #f))
           #:return ZI
           ]{

  Gets the system default ZoneId.

  @examples{
   check:
     nothing is nothing
   end
  }
 }
            
}