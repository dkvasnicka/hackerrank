(let [toys-count (read)
      money (read)
      toys (for [n (range toys-count)] (read))]
  (println 
    (count 
      (take-while #(<= % money) 
                  (reductions + (sort toys))))))
