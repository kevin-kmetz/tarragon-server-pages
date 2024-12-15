;; tarragon/init.fnl
;;
;; Parses Tarragon Server Pages - HTML files with
;; embedded Fennel code.

(local lpeg (require :lpeg))
(lpeg.locale lpeg)

(local unprintable (lpeg.S "\n\r\t"))
(local printable lpeg.print)
(local any (+ printable unprintable))

(local t-open (lpeg.P "[=="))
(local t-close (lpeg.P "==]"))

(local html-char (- any t-open))
(local fennel-char (- any t-close))
(local fennel-body (^ fennel-char 1))

(local html-code (^ html-char 1))
(local fennel-code (* t-open fennel-body t-close))

(fn tag-html [captured-text]
  {:language :html
   :text captured-text})

(fn tag-fennel [captured-text]
  {:language :fennel
   :text captured-text})

(local tsp (lpeg.Ct (^ (+ (/ fennel-code tag-fennel)
                          (/ html-code tag-html))
                       1)))

(local _testing {
  : tag-fennel
  : tag-html
  : fennel-code
  : html-code
  : fennel-body
  : fennel-char
  : html-char
  : t-close
  : t-open
  : any
  : printable
  : unprintable
})

(local export {
  : tsp
  : _testing
})

export
