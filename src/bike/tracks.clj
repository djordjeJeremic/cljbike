(ns bike.tracks
  (:require [clojure.java.jdbc :as j]
            [clojure.java.jdbc.sql :as s]))

(def mysql-db {:subprotocol "mysql"
               :subname "//localhost:3306/bike"
               :user "root"
               :pass " "})

(defn all []
  (j/query mysql-db
           ["select * from track inner join country on (track.country_id = country.id)"]))

(defn get [id]
  (j/query mysql-db
           (s/select * :track (s/where {:id id}))))

(defn create [params]
  (j/insert! mysql-db :track params))

(defn update [id params]
  (j/update! mysql-db :track params (s/where {:id id})))

(defn delete [id]
  (j/delete! mysql-db :track (s/where {:id id})))
