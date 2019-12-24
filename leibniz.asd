(asdf:defsystem leibniz
  :version "0.0.1"
  :author "Konrad Hinsen"
  :license "GPL2"
  :depends-on (:fset :cl-arrows)
  :components ((:file "defs")
               (:file "sorts" :depends-on ("defs")))
  :description "Digital notation")
