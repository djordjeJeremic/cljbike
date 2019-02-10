(ns bike.race_results
  (:require [clojure.java.jdbc :as j]
            [clojure.java.jdbc.sql :as s]))

(def mysql-db {:subprotocol "mysql"
               :subname "//localhost:3306/bike"
               :user "root"
               :pass " "})

(defn get [id]
  (first (j/query mysql-db
                  [(clojure.string/join ["
select track_name, d1.driver_name as d1_name, d2.driver_name as d2_name, 
d3.driver_name as d3_name, d4.driver_name as d4_name,
d5.driver_name as d5_name, d6.driver_name as d6_name, 
d7.driver_name as d7_name, d8.driver_name as d8_name, 
d9.driver_name as d9_name, d10.driver_name as d10_name 
from race_results inner join race on 
(race_results.race_id = race.id) 
inner join track on (race.track_id = track.id)
inner join driver d1 on (race_results.no1_id = d1.id) 
inner join driver d2 on (race_results.no2_id = d2.id) 
inner join driver d3 on (race_results.no3_id = d3.id) 
inner join driver d4 on (race_results.no4_id = d4.id) 
inner join driver d5 on (race_results.no5_id = d5.id) 
inner join driver d6 on (race_results.no6_id = d6.id) 
inner join driver d7 on (race_results.no7_id = d7.id) 
inner join driver d8 on (race_results.no8_id = d8.id) 
inner join driver d9 on (race_results.no9_id = d9.id) 
inner join driver d10 on (race_results.no10_id = d10.id) where race_results.race_id = ", id])])))

(defn create [params]
  (j/insert! mysql-db :race_results params))

(defn update [id params]
  (j/update! mysql-db :race_results params (s/where {:id id})))

(defn delete [id]
  (j/delete! mysql-db :race_results (s/where {:id id})))
