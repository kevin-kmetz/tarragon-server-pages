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

(local html-code (^ html-char 1))
(local fennel-code (* t-open (^ fennel-char 0) t-close))

(local tsp (^ (+ fennel-code html-code) 1))

{
  : tsp
  : fennel-code
  : html-code
  : fennel-char
  : html-char
  : t-open
  : t-close
  : any
  : printable
  : unprintable
}
