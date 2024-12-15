;; tarragon/interpreter.fnl

(local {: load-file} (require :tarragon/loader))
(local {:tsp parse} (require :tarragon/parser))

(fn assemble-function [page-path]
  (let [raw-content (load-file page-path)
        segments (parse:match raw-content)]
    (accumulate [program ""
                 index segment (ipairs segments)]
      (if (= segment.language :fennel)
        (.. program segment.text)
        program))))

(local export {
  : assemble-function
})

export
