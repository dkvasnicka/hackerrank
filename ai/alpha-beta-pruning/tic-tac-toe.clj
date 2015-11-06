;If player is X, I'm the first player.
;If player is O, I'm the second player.

(def vectors
  [(range 0 3)
   (range 3 6)
   (range 6 9)
   (range 0 7 3)
   (range 1 8 3)
   (range 2 9 3)
   (range 0 9 4)
   (range 2 7 2)])

(defn convert-to-numeric [chr]
  (case chr
      \X -1
      \O  1
      \_  0))

(defn read-board []
  (filter #(not= % \newline) 
    (apply concat (take 3 (repeatedly read-line)))))

; [0  0  0 
;  0  0  0 
;  0 -1  1]
(defn potential-states [board acc player]
  (let [next-idx (.indexOf acc 0)]
    (if (neg? next-idx)
      '()
      (cons (assoc board next-idx player) 
            (lazy-seq 
              (potential-states board 
                                (assoc acc next-idx player) 
                                player))))))

(defn scores? [player board]
  (some #(every? (partial = player) (map (partial nth board) %))
        vectors))

(defn next-move [player board]
  (let [moves (potential-states board board player)
        some-win (some #(when (scores? player %) %) moves)]
    some-win))

(let [player (convert-to-numeric (first (read-line)))
      board (mapv convert-to-numeric (read-board))]
  (println (next-move player board)))
