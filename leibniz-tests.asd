(asdf:defsystem leibniz-tests
  :version "0.0.1"
  :author "Konrad Hinsen"
  :license "GPL2"
  :depends-on (:leibniz :1am :fset :cl-arrows)
  :components ((:file "defs-tests")
               (:file "sort-tests" :depends-on ("defs-tests")))
  :description "Tests for the digital notation Leibniz")
