#lang scribble/manual
@(require "../../scribble-api.rkt" "../abbrevs.rkt")
@(require (only-in scribble/core delayed-block))

@(append-gen-docs
  `(module "temporal"
     (path "src/js/base/runtime-anf.js")
     (data-spec
      (name "Temporal")
      (variants ("naive-date" "naive-time" "offset-time" "naive-date-time" "utc-date-time" "offset-date-time" "zoned-date-time"))
      (shared (
               (method-spec (name "at-start-of-day"))
               
               )))
     (fun-spec (name "make-temporal"))
     (fun-spec (name "temporal"))
     
     (fun-spec (name "duration-of-any"))
     
     ))

@docmodule["temporal"]{


                       
 @ignore[(list "make-temporal")]

 @section{The Temporal Datatype}

 @data-spec2["Temporal" '() (list
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
  The Temporal type has several branches, each of which represents
  a different kind of temporal object, i.e. date, time, or date-time.
  First, there are three timezone-ignorant branches provided for dates
  and times, and multiple timezone-aware branches as well. Timezone
  data is represented in three ways: (a) UTC time, (b) different
  ZoneOffsets, and (c) ZoneIDs, which will map to specific offsets.

  @margin-note{DateTimes with different timezone types are distinct
   and do not mix, but can be converted to and from each other.}
  
  Among other features, these types support:
  - Addition and subtraction of durations from dates, times, and
  date-times.
  - Before/after and equality comparisons among timezone-aware and
  timezone-ignorant types.
  - Parsing and formatting operations to and from different
  representations of datetimes (TODO).

  @margin-note{Each of these branches is also associated with a
   type, thereby allowing type annotations within user programs.}
 }

  
 @section{Temporal Methods}

 TODO

   
    
 @section{Temporal Functions}

 These functions require the Temporal module to be
 @pyret{import}ed, as indicated in the examples.

 
 TODO

  
}

@include-section["naive-date.scrbl"]
@include-section["naive-time.scrbl"]
@include-section["offset-time.scrbl"]