;; tests/visual_test_01.fnl

(print "\nNow running 'tests/visual_test_01.fnl'...")

(print "Loading the Tarragon library...")
(local tg (require :tarragon/parser))

(fn print* [...]
  (print (accumulate [concatenated ""
                      i v (ipairs [...])]
           (.. concatenated (tostring v)))))

(local tsp-file-name "./tests/sample_page_01.tsp")
(local tsp-file-name* (.. "\"" tsp-file-name "\""))

(print* "\nNow attempting to load " tsp-file-name* "...")
(local tsp-file (io.open tsp-file-name :r))

(local tsp-code (tsp-file:read :*all))
(print "\nThe loaded text:\n")
(print tsp-code)


(local tsp-segments (tg.tsp:match tsp-code))

(print "Now printing all Tarragon server pages code segments recognized...\n")

(each [i v (ipairs tsp-segments)]
  (print* "Segment " i " is a " (. (. tsp-segments i) :language) " segment:")
  (print (. (. tsp-segments i) :text))
  (print))

;; It's worth noting here that it's actually impossible to create a text file
;; that isn't recognized as a valid Tarragon server page right now, and won't
;; be possible until validation of HTML code and Fennel code is implemented.
;;
;; All that will be implemented for now is essentially 'destructuring' of Tarragon
;; server pages into a sequential table of 'code', 'not-code', 'code', 'not-code' and
;; so on, to be iterated over and processed.
;;
;; This is quick'n'dirty - meant to support another program I am more interested in writing -
;; and so true syntax validation will not be implemented for quite some time.
