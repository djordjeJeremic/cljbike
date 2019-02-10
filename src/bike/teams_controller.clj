(ns bike.teams-controller
  (:require [clostache.parser :as clostache]
            [bike.drivers :as drivers]
            [bike.teams :as teams]
            [bike.countries :as countries]))

(defn read-template [template-name]
  (slurp (clojure.java.io/resource
           (str "views/teams/" template-name ".mustache"))))

(defn render-template [template-file params]
  (clostache/render (read-template template-file) params))

