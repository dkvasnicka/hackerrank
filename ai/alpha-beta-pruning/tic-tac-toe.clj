(ns solution 
    (:use clojure.data)
    (:gen-class))

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

(defn minimax [player board score scorefns]
  (if (scores? player board)
    score
    (let [moves (potential-states board board (- player))]
      (apply (first scorefns) 
             (cons 0 (map #(minimax (- player) % (- score) (rest scorefns)) moves))))))

(defn play [player board]
  (let [moves (potential-states board board player)]
    (apply max-key #(minimax player % 10 (flatten (repeat [min max]))) moves)))

(defn coords [oldb newb]
  (let [pos (dec (count (first (diff oldb newb))))
        coo ((juxt quot rem) pos 3)]
    (str (first coo) " " (second coo))))

(defn -main []
  (let [player (convert-to-numeric (first (read-line)))
        board  (mapv convert-to-numeric (read-board))]
    (println (coords board (play player board)))))

(try (require 'leiningen.exec)
     (when @(ns-resolve 'leiningen.exec '*running?*)
       (apply -main (rest *command-line-args*)))
     (catch java.io.FileNotFoundException e))
