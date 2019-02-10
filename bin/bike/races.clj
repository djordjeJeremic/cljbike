(ns bike.races
  (:require [clojure.java.jdbc :as j]
            [clojure.java.jdbc.sql :as s]))

(def mysql-db {:subprotocol "mysql"
               :subname "//localhost:3306/bike"
               :user "root"
               :pass " "})

(defn all []
  (j/query mysql-db
           ["select * from race inner join track on (race.track_id = track.id)"]))

(defn get [id]
  (first (j/query mysql-db
                  [(clojure.string/join ["select * from race inner join track on (race.track_id = track.id) where race.id = ", id])])))

(defn create [params]
  (j/insert! mysql-db :race params))

(defn update [id params]
  (j/update! mysql-db :race params (s/where {:id id})))

(defn delete [id]
  (j/delete! mysql-db :race (s/where {:id id})))
