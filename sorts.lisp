(in-package :leibniz)
(export '(empty-sort-graph
          add-sort
          has-sort?
          is-subsort?))

(defclass sort-graph ()
  ((kinds
    :initarg :kinds
    :initform (empty-map)
    :documentation "Map assigning a kind (set of sorts) to each sort")
   (supersorts
    :initarg :supersorts
    :initform (empty-map)
    :documentation "Map from sorts to their supersorts (sets of sorts)")
   (subsorts
    :initarg :subsorts
    :initform (empty-map)
    :documentation "Map from sorts to their subsorts (sets of sorts)")))

(defun empty-sort-graph ()
  (make-instance 'sort-graph))

(defun has-sort? (sg sort)
  (with-slots (subsorts) sg
    (domain-contains? subsorts sort)))

(defun validate-sort (sg sort)
  (assert (has-sort? sg sort)))

(defun is-subsort? (sg sort1 sort2)
  (with-slots (subsorts) sg
    (validate-sort sg sort1)
    (validate-sort sg sort2)
    (or (equal sort1 sort2)
        (let ((ss (@ subsorts sort2)))
          (or (contains? ss sort1)
              (some (lambda (s) (is-subsort? sort1 s)) ss))))))

(defun add-sort (sg new-sort)
  (assert (symbolp new-sort))
  (if (has-sort? sg new-sort)
      sg
      (with-slots (kinds supersorts subsorts) sg
        (make-instance 'sort-graph
                       :kinds (with kinds new-sort (set new-sort))
                       :supersorts (with supersorts new-sort (empty-set))
                       :subsorts (with subsorts new-sort (empty-set))))))
