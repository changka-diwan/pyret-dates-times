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
     
     (fun-spec (name "string-to-zone-id"))
     (fun-spec (name "system-default-zone-id"))
     ))

@docmodule["zone-id"]{

 @ignore[(list "make-zone-id")]

 @section{The ZoneId Datatype}

 @data-spec2["ZoneId" '() (list
                           @singleton-spec2["ZoneId" "A"]
                           @singleton-spec2["ZoneId" "ACDT"]
                           @singleton-spec2["ZoneId" "ACST"]
                           @singleton-spec2["ZoneId" "ACT"]
                           @singleton-spec2["ZoneId" "ACT"]
                           @singleton-spec2["ZoneId" "ACWST"]
                           @singleton-spec2["ZoneId" "ADT"]
                           @singleton-spec2["ZoneId" "ADT "]
                           @singleton-spec2["ZoneId" "AEDT"]
                           @singleton-spec2["ZoneId" "AEST"]
                           @singleton-spec2["ZoneId" "AET"]
                           @singleton-spec2["ZoneId" "AFT"]
                           @singleton-spec2["ZoneId" "AKDT"]
                           @singleton-spec2["ZoneId" "AKST"]
                           @singleton-spec2["ZoneId" "ALMT"]
                           @singleton-spec2["ZoneId" "AMST"]
                           @singleton-spec2["ZoneId" "AMST"]
                           @singleton-spec2["ZoneId" "AMT"]
                           @singleton-spec2["ZoneId" "AMT"]
                           @singleton-spec2["ZoneId" "ANAST"]
                           @singleton-spec2["ZoneId" "ANAT"]
                           @singleton-spec2["ZoneId" "AQTT"]
                           @singleton-spec2["ZoneId" "ART"]
                           @singleton-spec2["ZoneId" "AST"]
                           @singleton-spec2["ZoneId" "AST"]
                           @singleton-spec2["ZoneId" "AT"]
                           @singleton-spec2["ZoneId" "AWDT"]
                           @singleton-spec2["ZoneId" "AWST"]
                           @singleton-spec2["ZoneId" "AZOST"]
                           @singleton-spec2["ZoneId" "AZOT"]
                           @singleton-spec2["ZoneId" "AZST"]
                           @singleton-spec2["ZoneId" "AoE"]
                           @singleton-spec2["ZoneId" "B"]
                           @singleton-spec2["ZoneId" "BNT"]
                           @singleton-spec2["ZoneId" "BOT"]
                           @singleton-spec2["ZoneId" "BRST"]
                           @singleton-spec2["ZoneId" "BRT"]
                           @singleton-spec2["ZoneId" "BST"]
                           @singleton-spec2["ZoneId" "BST"]
                           @singleton-spec2["ZoneId" "BST"]
                           @singleton-spec2["ZoneId" "BTT"]
                           @singleton-spec2["ZoneId" "C"]
                           @singleton-spec2["ZoneId" "CAST"]
                           @singleton-spec2["ZoneId" "CAT"]
                           @singleton-spec2["ZoneId" "CCT"]
                           @singleton-spec2["ZoneId" "CDT"]
                           @singleton-spec2["ZoneId" "CDT"]
                           @singleton-spec2["ZoneId" "CEST"]
                           @singleton-spec2["ZoneId" "CET"]
                           @singleton-spec2["ZoneId" "CHADT"]
                           @singleton-spec2["ZoneId" "CHAST"]
                           @singleton-spec2["ZoneId" "CHOST"]
                           @singleton-spec2["ZoneId" "CHOT"]
                           @singleton-spec2["ZoneId" "CHUT"]
                           @singleton-spec2["ZoneId" "CIDST"]
                           @singleton-spec2["ZoneId" "CIST"]
                           @singleton-spec2["ZoneId" "CKT"]
                           @singleton-spec2["ZoneId" "CLST"]
                           @singleton-spec2["ZoneId" "CLT"]
                           @singleton-spec2["ZoneId" "COT"]
                           @singleton-spec2["ZoneId" "CST"]
                           @singleton-spec2["ZoneId" "CST"]
                           @singleton-spec2["ZoneId" "CST"]
                           @singleton-spec2["ZoneId" "CT"]
                           @singleton-spec2["ZoneId" "CVT"]
                           @singleton-spec2["ZoneId" "CXT"]
                           @singleton-spec2["ZoneId" "ChST"]
                           @singleton-spec2["ZoneId" "D"]
                           @singleton-spec2["ZoneId" "DAVT"]
                           @singleton-spec2["ZoneId" "DDUT"]
                           @singleton-spec2["ZoneId" "E"]
                           @singleton-spec2["ZoneId" "EASST"]
                           @singleton-spec2["ZoneId" "EAST"]
                           @singleton-spec2["ZoneId" "EAT"]
                           @singleton-spec2["ZoneId" "ECT"]
                           @singleton-spec2["ZoneId" "EDT"]
                           @singleton-spec2["ZoneId" "EEST"]
                           @singleton-spec2["ZoneId" "EET"]
                           @singleton-spec2["ZoneId" "EGST"]
                           @singleton-spec2["ZoneId" "EGT"]
                           @singleton-spec2["ZoneId" "EST"]
                           @singleton-spec2["ZoneId" "ET"]
                           @singleton-spec2["ZoneId" "F"]
                           @singleton-spec2["ZoneId" "FET"]
                           @singleton-spec2["ZoneId" "FJST"]
                           @singleton-spec2["ZoneId" "FJT"]
                           @singleton-spec2["ZoneId" "FKST"]
                           @singleton-spec2["ZoneId" "FKT"]
                           @singleton-spec2["ZoneId" "FNT"]
                           @singleton-spec2["ZoneId" "G"]
                           @singleton-spec2["ZoneId" "GALT"]
                           @singleton-spec2["ZoneId" "GAMT"]
                           @singleton-spec2["ZoneId" "GET"]
                           @singleton-spec2["ZoneId" "GFT"]
                           @singleton-spec2["ZoneId" "GILT"]
                           @singleton-spec2["ZoneId" "GMT"]
                           @singleton-spec2["ZoneId" "GST"]
                           @singleton-spec2["ZoneId" "GST"]
                           @singleton-spec2["ZoneId" "GYT"]
                           @singleton-spec2["ZoneId" "H"]
                           @singleton-spec2["ZoneId" "HDT"]
                           @singleton-spec2["ZoneId" "HKT"]
                           @singleton-spec2["ZoneId" "HOVST"]
                           @singleton-spec2["ZoneId" "HOVT"]
                           @singleton-spec2["ZoneId" "HST"]
                           @singleton-spec2["ZoneId" "I"]
                           @singleton-spec2["ZoneId" "ICT"]
                           @singleton-spec2["ZoneId" "IDT"]
                           @singleton-spec2["ZoneId" "IOT"]
                           @singleton-spec2["ZoneId" "IRDT"]
                           @singleton-spec2["ZoneId" "IRKST"]
                           @singleton-spec2["ZoneId" "IRKT"]
                           @singleton-spec2["ZoneId" "IRST"]
                           @singleton-spec2["ZoneId" "IST"]
                           @singleton-spec2["ZoneId" "IST"]
                           @singleton-spec2["ZoneId" "IST"]
                           @singleton-spec2["ZoneId" "JST"]
                           @singleton-spec2["ZoneId" "K"]
                           @singleton-spec2["ZoneId" "KGT"]
                           @singleton-spec2["ZoneId" "KOST"]
                           @singleton-spec2["ZoneId" "KRAST"]
                           @singleton-spec2["ZoneId" "KRAT"]
                           @singleton-spec2["ZoneId" "KST"]
                           @singleton-spec2["ZoneId" "KUYT"]
                           @singleton-spec2["ZoneId" "L"]
                           @singleton-spec2["ZoneId" "LHDT"]
                           @singleton-spec2["ZoneId" "LHST"]
                           @singleton-spec2["ZoneId" "LINT"]
                           @singleton-spec2["ZoneId" "M"]
                           @singleton-spec2["ZoneId" "MAGST"]
                           @singleton-spec2["ZoneId" "MAGT"]
                           @singleton-spec2["ZoneId" "MART"]
                           @singleton-spec2["ZoneId" "MAWT"]
                           @singleton-spec2["ZoneId" "MDT"]
                           @singleton-spec2["ZoneId" "MHT"]
                           @singleton-spec2["ZoneId" "MMT"]
                           @singleton-spec2["ZoneId" "MSD"]
                           @singleton-spec2["ZoneId" "MSK"]
                           @singleton-spec2["ZoneId" "MST"]
                           @singleton-spec2["ZoneId" "MT"]
                           @singleton-spec2["ZoneId" "MUT"]
                           @singleton-spec2["ZoneId" "MVT"]
                           @singleton-spec2["ZoneId" "MYT"]
                           @singleton-spec2["ZoneId" "N"]
                           @singleton-spec2["ZoneId" "NCT"]
                           @singleton-spec2["ZoneId" "NDT"]
                           @singleton-spec2["ZoneId" "NFDT"]
                           @singleton-spec2["ZoneId" "NFT"]
                           @singleton-spec2["ZoneId" "NOVST"]
                           @singleton-spec2["ZoneId" "NOVT"]
                           @singleton-spec2["ZoneId" "NPT"]
                           @singleton-spec2["ZoneId" "NRT"]
                           @singleton-spec2["ZoneId" "NST"]
                           @singleton-spec2["ZoneId" "NUT"]
                           @singleton-spec2["ZoneId" "NZDT"]
                           @singleton-spec2["ZoneId" "NZST"]
                           @singleton-spec2["ZoneId" "O"]
                           @singleton-spec2["ZoneId" "OMSST"]
                           @singleton-spec2["ZoneId" "OMST"]
                           @singleton-spec2["ZoneId" "P"]
                           @singleton-spec2["ZoneId" "PDT"]
                           @singleton-spec2["ZoneId" "PET"]
                           @singleton-spec2["ZoneId" "PETST"]
                           @singleton-spec2["ZoneId" "PETT"]
                           @singleton-spec2["ZoneId" "PGT"]
                           @singleton-spec2["ZoneId" "PHOT"]
                           @singleton-spec2["ZoneId" "PHT"]
                           @singleton-spec2["ZoneId" "PKT"]
                           @singleton-spec2["ZoneId" "PMDT"]
                           @singleton-spec2["ZoneId" "PMST"]
                           @singleton-spec2["ZoneId" "PONT"]
                           @singleton-spec2["ZoneId" "PST"]
                           @singleton-spec2["ZoneId" "PST"]
                           @singleton-spec2["ZoneId" "PT"]
                           @singleton-spec2["ZoneId" "PWT"]
                           @singleton-spec2["ZoneId" "PYST"]
                           @singleton-spec2["ZoneId" "PYT"]
                           @singleton-spec2["ZoneId" "PYT"]
                           @singleton-spec2["ZoneId" "Q"]
                           @singleton-spec2["ZoneId" "QYZT"]
                           @singleton-spec2["ZoneId" "R"]
                           @singleton-spec2["ZoneId" "RET"]
                           @singleton-spec2["ZoneId" "ROTT"]
                           @singleton-spec2["ZoneId" "S"]
                           @singleton-spec2["ZoneId" "SAKT"]
                           @singleton-spec2["ZoneId" "SAMT"]
                           @singleton-spec2["ZoneId" "SAST"]
                           @singleton-spec2["ZoneId" "SBT"]
                           @singleton-spec2["ZoneId" "SCT"]
                           @singleton-spec2["ZoneId" "SGT"]
                           @singleton-spec2["ZoneId" "SRET"]
                           @singleton-spec2["ZoneId" "SRT"]
                           @singleton-spec2["ZoneId" "SST"]
                           @singleton-spec2["ZoneId" "SYOT"]
                           @singleton-spec2["ZoneId" "T"]
                           @singleton-spec2["ZoneId" "TAHT"]
                           @singleton-spec2["ZoneId" "TFT"]
                           @singleton-spec2["ZoneId" "TJT"]
                           @singleton-spec2["ZoneId" "TKT"]
                           @singleton-spec2["ZoneId" "TLT"]
                           @singleton-spec2["ZoneId" "TMT"]
                           @singleton-spec2["ZoneId" "TOST"]
                           @singleton-spec2["ZoneId" "TOT"]
                           @singleton-spec2["ZoneId" "TRT"]
                           @singleton-spec2["ZoneId" "TVT"]
                           @singleton-spec2["ZoneId" "U"]
                           @singleton-spec2["ZoneId" "ULAST"]
                           @singleton-spec2["ZoneId" "ULAT"]
                           @singleton-spec2["ZoneId" "UTC"]
                           @singleton-spec2["ZoneId" "UYST"]
                           @singleton-spec2["ZoneId" "UYT"]
                           @singleton-spec2["ZoneId" "UZT"]
                           @singleton-spec2["ZoneId" "V"]
                           @singleton-spec2["ZoneId" "VET"]
                           @singleton-spec2["ZoneId" "VLAST"]
                           @singleton-spec2["ZoneId" "VLAT"]
                           @singleton-spec2["ZoneId" "VOST"]
                           @singleton-spec2["ZoneId" "VUT"]
                           @singleton-spec2["ZoneId" "W"]
                           @singleton-spec2["ZoneId" "WAKT"]
                           @singleton-spec2["ZoneId" "WARST"]
                           @singleton-spec2["ZoneId" "WAST"]
                           @singleton-spec2["ZoneId" "WAT"]
                           @singleton-spec2["ZoneId" "WEST"]
                           @singleton-spec2["ZoneId" "WET"]
                           @singleton-spec2["ZoneId" "WFT"]
                           @singleton-spec2["ZoneId" "WGST"]
                           @singleton-spec2["ZoneId" "WGT"]
                           @singleton-spec2["ZoneId" "WIB"]
                           @singleton-spec2["ZoneId" "WIT"]
                           @singleton-spec2["ZoneId" "WITA"]
                           @singleton-spec2["ZoneId" "WST"]
                           @singleton-spec2["ZoneId" "WT"]
                           @singleton-spec2["ZoneId" "X"]
                           @singleton-spec2["ZoneId" "Y"]
                           @singleton-spec2["ZoneId" "YAKST"]
                           @singleton-spec2["ZoneId" "YAKT"]
                           @singleton-spec2["ZoneId" "YAPT"]
                           @singleton-spec2["ZoneId" "YEKST"]
                           @singleton-spec2["ZoneId" "YEKT"]
                           @singleton-spec2["ZoneId" "Z"]

                             
                             )]
 @nested[#:style 'inset]{                  
  The ZoneId stores the Time-Zone codes of all ZoneOffsets around the world.
  
  Each code is mapped to a specific offset in a key-value pair dictionary to allow
  conversion between ZoneId and ZoneOffset, thereby within Temporal objects.

  
 }

 @section{ZoneId Methods}

 @zi-method["get-zone-offset"
           #:contract (a-arrow ZI ZO)
           #:args (list (list "self" #f))
           #:return ZO
           ]

 Gets the ZoneOffset of the ZoneId.

 @examples{
  check:
    IST.get-zone-offset()
      is zone-offset(5, 30)
    UTC.get-zone-offset()
      is zone-offset(0, 0)
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
 
 @section{ZoneId Functions}

 These functions require the ZoneId module to be
 @pyret{import}ed, as indicated in the examples.

 @function["string-to-zone-id"
           #:contract (a-arrow N ZI)
           #:args '(("text" #f))
           #:return ZI
           ]{

  Obtains an instance of ZoneId from a String ensuring
  that the ZoneId is supported.

  @examples{
   check:
     string-to-zone-id("IST") is IST
     string-to-zone-id("EST") is EST
   end
  }
 }

 @function["system-default-zone-id"
           #:contract (a-arrow N ZI)
           #:args '()
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