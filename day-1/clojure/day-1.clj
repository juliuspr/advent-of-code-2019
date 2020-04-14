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
; Calculate fuel for a mass unit
(defn calc-fuel [mass]
  (- (quot mass 3) 2))

; Calculate fuel need for given amount of fuel
(defn fuel-for-fuel [total, initial-fuel] 
 (if (< initial-fuel 1)
   total
   (fuel-for-fuel (+ total initial-fuel) (calc-fuel initial-fuel) )))

; Calculate total amount of fuel for module
(defn fuel-for-module [module-mass] 
 (fuel-for-fuel 0, (calc-fuel module-mass)))

;; RESULT
(print (reduce + (map fuel-for-module vector-of-modules)))