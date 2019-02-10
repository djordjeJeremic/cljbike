(ns bike.teams
  (:require [clojure.java.jdbc :as j]
            [clojure.java.jdbc.sql :as s]))

(def mysql-db {:subprotocol "mysql"
               :subname "//localhost:3306/bike"
               :user "root"
               :pass " "})

(defn all []
  (j/query mysql-db
           (s/select * :team)))

(defn get [id]
  (j/query mysql-db
           (s/select * :team (s/where {:id id}))))

(defn create [params]
  (j/insert! mysql-db :team params))

(defn update [id params]
  (j/update! mysql-db :team params (s/where {:id id})))

(defn delete [id]
  (j/delete! mysql-db :team (s/where {:id id})))

