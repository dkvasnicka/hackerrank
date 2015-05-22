(require 'clojure.string)

(defn compute-next [in out shift]
  (let [lastout (peek out)]
    (bit-xor lastout               
             (first in) 
             lastout 
             (second in))))

(let [size 7 ;(read)
      shift 4 ;(read)
     ; _ (read-line)
      input '(1 1 1 0 1 0 0 1 1 0) ;(map (comp #(Integer/parseInt %) str) (read-line))
      output [(first input)]
      threshold (- size shift)]
  (print (first output))
  (loop [out output
         counter (dec size)
         in input]
        (if (zero? counter)
          out
          (let [nextbit (compute-next in out shift)
                newbit (if (<= counter threshold) 
                         (bit-xor nextbit (nth out (- (count out) shift))) 
                         nextbit)]
            (print newbit)
            (recur 
              (conj out newbit)
              (dec counter)
              (rest in))))))
