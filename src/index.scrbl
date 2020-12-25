#lang scribble/manual

@(require (for-syntax syntax/parse)
          (for-syntax racket/base))

@(define cca (current-command-line-arguments))
@(define VERSION
  (if (> (vector-length cca) 0)
        (vector-ref cca 0)
        ""))

@(define-syntax (include-section/if-set stx)
  (syntax-parse stx
    [(_ envvar-stx:str file:str)
     (let* ((envvar (syntax->datum #'envvar-stx))
            (envvar (getenv envvar)))
       (if envvar
         #'(include-section file)
         #'(void)))]))

@title[#:version @VERSION]{Pyret}


@nested{This document contains the date-time library for Pyret, along with many
examples and some longer descriptions of language design choices. 

The official Pyret documentation can be found @link["https://www.pyret.org/docs/latest/" "here"].}

@include-section["libraries.scrbl"]
