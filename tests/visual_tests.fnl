;; tests/visual-tests.fnl

(local fennel (require :fennel))
(set fennel.path (.. fennel.path ";./src/?.fnl;./src/?/init.fnl"))

(require :tests/visual_test_01)
