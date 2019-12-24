(in-package :leibniz-tests)

(test sort-graph-construction
  (let ((an-s-graph (-> (empty-sort-graph)
                        (add-sort 'A) (add-sort 'B)
                        (add-sort 'C) (add-sort 'D))))
    (is (equal an-s-graph (add-sort an-s-graph 'A)))))
