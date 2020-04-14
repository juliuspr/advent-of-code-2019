(ns aoc2019.day1)
(require '[clojure.string :as str])

;; PREPARE DATA
; Fetch data from the file.
(def s (slurp "./../day-1-input.txt"))

; Convert file string into a vector of integers.
(def vector-of-modules 
 (map 
  #(Integer/parseInt %) 
  (str/split-lines (str/trim s))))

;; FUNCTIONS
(defn calc-fuel [mass]
  "Calculate fuel for a mass unit"
  (- (quot mass 3) 2))

(defn fuel-for-fuel [total, initial-fuel]
 "Calculate fuel need for given amount of fuel"
 (if (< initial-fuel 1)
   total
   (fuel-for-fuel (+ total initial-fuel) (calc-fuel initial-fuel) )))

(defn fuel-for-module [module-mass] 
 "Calculate total amount of fuel for module"
 (fuel-for-fuel 0, (calc-fuel module-mass)))

;; RESULT
(print (reduce + (map fuel-for-module vector-of-modules)))