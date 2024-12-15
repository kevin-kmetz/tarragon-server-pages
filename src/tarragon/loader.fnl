;; tarragon/loader.fnl
;;
;; For loading server pages (or any file with embedded Fennel for
;; that matter, whether HTML or not) and returning the file as a string.
;;
;; Yes, this probably does not need to be its own module. I don't like
;; polluting the core functionality of other modules with such mundane
;; tasks, though.
;;
;; This also enables me to come back and implement more thorough
;; error-handling here.

(fn load-file [file-path]
  (let [file (io.open file-path :r)]
    (file:read :*all)))

(local export {
  : load-file
})

export
