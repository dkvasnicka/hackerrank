(require 'clojure.string)

(let [size (read)
      shift (read)
      _ (read-line)
      input (map (comp #(Integer/parseInt %) str) (read-line))
      output (list (first input))]
  (println
    (clojure.string/join
      (reverse
        (loop [out output
               counter (dec size)
               in (rest input)]
              (if (zero? counter)
                out
                (recur 
                  (cons  
                    (reduce bit-xor 
                            (first in) 
                            (take (dec shift) out))
                    out)
                  (dec counter)
                  (rest in))))))))
