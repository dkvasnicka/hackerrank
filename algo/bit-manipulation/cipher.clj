(require 'clojure.string)

(defn phase1 [in out shift]
  (reduce bit-xor 
          (second in) 
          (take-last (dec shift) out)))

(defn phase2 [in out shift]
  (let [lastout (peek out)]
    (bit-xor lastout 
             (nth out (- (count out) shift)) 
             (first in) 
             lastout 
             (second in))))

(let [size 7 ;(read)
      shift 4 ;(read)
     ; _ (read-line)
      input '(1 1 1 0 1 0 0 1 1 0) ;(map (comp #(Integer/parseInt %) str) (read-line))
      output [(first input)]]
  (print (first output))
  (loop [out output
         counter (dec size)
         in input 
         phase-fns (lazy-cat (repeat shift phase1) (repeat phase2))]
        (if (zero? counter)
          out
          (let [newbit ((first phase-fns) in out shift)]
            (print newbit)
            (recur 
              (conj out newbit)
              (dec counter)
              (rest in)
              (rest phase-fns))))))
