(ns bike.handler
  (:use compojure.core)
  (:require [compojure.handler :as handler]
            [compojure.route :as route]
            [ring.util.response :as resp]
            [bike.controller :as controller]
            [bike.teams-controller :as teams-controller]
            [bike.drivers :as drivers]
            [bike.teams :as teams]
            [bike.countries :as countries]
            [bike.tracks :as tracks]
            [bike.races :as races]
            [bike.race_results :as race_results]))

;(defn foo
;  "I don't do a whole lot."
;  [x]
;  (println x "Hello, World!"))

(defroutes public-routes
  (GET "/" [] (controller/index))
  (GET "/drivers" [] (controller/drivers))
  (route/resources "/")
  (GET "/drivers/new" [] (controller/new))
  (GET "/drivers/:id/delete" [id]
       (do (drivers/delete id)
        (resp/redirect "/drivers")))
  (POST "/drivers/create" [& params]
        (do (drivers/create params)
         (resp/redirect "/drivers")))
  (POST "/drivers/:id/update" [& params]
       (do (drivers/update (:id params) params)
         (resp/redirect "/drivers")))
  (GET "/drivers/:id/edit" [id] (controller/edit id))
  (GET "/teams" [] (controller/teams))
  (POST "/teams/create" [& params]
        (do (teams/create params)
          (resp/redirect "/teams")))
  (GET "/teams/:id/delete" [id]
       (do (teams/delete id)
         (resp/redirect "/teams")))
  (GET "/countries" [] (controller/countries))
  (POST "/countries/create" [& params]
        (do (countries/create params)
          (resp/redirect "/countries")))
  (GET "/countries/:id/delete" [id]
       (do (countries/delete id)
         (resp/redirect "/countries")))
  (GET "/tracks" [] (controller/tracks))
  (POST "/tracks/create" [& params]
        (do (tracks/create params)
          (resp/redirect "/tracks")))
  (GET "/tracks/:id/delete" [id]
       (do (tracks/delete id)
         (resp/redirect "/tracks")))
  (GET "/races" [] (controller/races))
  (POST "/races/create" [& params]
        (do (races/create params)
          (resp/redirect "/races")))
  (GET "/races/:id/edit" [id] (controller/edit-race id))
  (POST "/races/:id/update" [& params]
        (do (races/update params)
          (resp/redirect "/races")))
  (GET "/races/:id/results" [id] (controller/race-results id))
  (POST "/race_results/create" [& params]
        (do (race_results/create params)
          (resp/redirect "/races")))
  (GET "/race_results/new" [] (controller/new-results))
  (GET "/driver_standings" [] (controller/driver-standings)))

(defroutes app-routes 
  public-routes 
  (route/not-found "404 Not Found"))

(def app 
  (handler/site app-routes))
