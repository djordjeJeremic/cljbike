(ns bike.countries
  (:require [clojure.java.jdbc :as j]
            [clojure.java.jdbc.sql :as s]))

(def mysql-db {:subprotocol "mysql"
               :subname "//localhost:3306/bike"
               :user "root"
               :pass " "})

(defn all []
  (j/query mysql-db
           (s/select * :country)))

(defn get [id]
  (j/query mysql-db
           (s/select * :country (s/where {:id id}))))

(defn create [params]
  (j/insert! mysql-db :country params))

(defn update [id params]
  (j/update! mysql-db :country params (s/where {:id id})))

(defn delete [id]
  (j/delete! mysql-db :country (s/where {:id id})))

