(let [len     (read)
      nums    (repeatedly len read)
      [[x _]] (filter (comp (partial = 1) second) (frequencies nums))]
  (println x))
