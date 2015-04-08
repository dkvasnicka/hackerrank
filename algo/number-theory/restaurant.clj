(import '(java.math BigInteger))

(dotimes [_ (read)]
  (let [a (BigInteger/valueOf (read))
        b (BigInteger/valueOf (read))
        gcd (.gcd a b)]
    (println 
      (long
        (* (/ a gcd) (/ b gcd))))))
