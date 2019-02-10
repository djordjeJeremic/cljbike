(ns bike.drivers
  (:refer-clojure :exclude [get])
  (:require [clojure.java.jdbc :as j]
            [clojure.java.jdbc.sql :as s]))

(def mysql-db {:subprotocol "mysql"
               :subname "//localhost:3306/bike"
               :user "root"
               :pass " "})

(defn all []
  (j/query mysql-db
           ["select * from driver inner join team on (driver.team_id = team.id) 
inner join country on (driver.country_id = country.id)"]))

(defn get [id]
  (first (j/query mysql-db
                  (s/select * :driver (s/where {:id id})))))

(defn create [params]
  (j/insert! mysql-db :driver params))

(defn update [id params]
  (j/update! mysql-db :driver params (s/where {:id id})))

(defn delete [id]
  (j/delete! mysql-db :driver (s/where {:id id})))

(defn get-standings []
  (j/query mysql-db
           ["select * from driver inner join team on (driver.team_id = team.id) 
order by driver_points desc"]))

