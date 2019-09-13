(ns bike.controller
  (:require [clostache.parser :as clostache]
            [bike.drivers :as drivers]
            [bike.teams :as teams]
            [bike.countries :as countries]
            [bike.tracks :as tracks]
            [bike.races :as races]
            [bike.race_results :as race-results]))

(defn read-template [template-name]
  (slurp (clojure.java.io/resource
           (str "views/" template-name ".mustache"))))

(defn render-template [template-file params]
  (clostache/render (read-template template-file) params))

(defn drivers []
  (render-template "drivers" {:drivers (drivers/all)}))

(defn index []
  (render-template "index" {}))

(defn new []
  (render-template "new_driver" {:teams (teams/all)
                                 :countries (countries/all)}))

(defn edit [id]
  (render-template "edit_driver" {:teams (teams/all)
                                  :countries (countries/all)
                                  :driver (drivers/get id)}))

(defn teams []
  (render-template "teams" {:teams (teams/all)}))

(defn countries []
  (render-template "countries" {:countries (countries/all)}))

(defn tracks []
  (render-template "tracks" {:tracks (tracks/all)
                             :countries (countries/all)}))

(defn races []
  (render-template "races" {:races (races/all)
                            :tracks (tracks/all)}))

(defn edit-race [id]
  (render-template "edit_race" {:race (races/get id)}))

(defn race-results [id]
  (render-template "race_results" {:race_results (race-results/get id)}))

(defn new-results []
  (render-template "new_results" {:races (races/all)
                                  :drivers (drivers/all)}))

(defn driver-standings []
  (render-template "driver_standings" {:drivers (drivers/get-standings)}))

(defn edit-country [id]
  (render-template "edit_country" {:country (countries/get id)}))
