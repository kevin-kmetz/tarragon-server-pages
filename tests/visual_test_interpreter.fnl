;; tests/visual_test_interpreter.fnl

(local fennel (require :fennel))
(local interpreter (require :tarragon/interpreter))

(print "\nNow running 'tests/visual_test_interpreter.fnl'...")

(print "\nNow assembling a function from the interpreted Tarragon server page...")
(local composite (interpreter.assemble-function "./tests/sample_page_01.tsp"))

(print "\nNow displaying the page reduced to only Fennel code...")
(print composite)

(print "\nNow evaluating the extracted program...")
(fennel.eval composite)

(print)
