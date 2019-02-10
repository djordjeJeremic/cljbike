(defproject bike "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.6.0"]
                 [compojure "1.1.6"]
                 [org.clojure/java.jdbc "0.3.0-alpha5"]
                 [mysql/mysql-connector-java "5.1.25"]
                 [de.ubercode.clostache/clostache "1.3.1"]
                 ;[korma "0.4.0"]
                 [ring "1.2.0"]]
  :plugins [[lein-ring "0.8.10"]]
  :ring {:handler bike.handler/app
         :port 2121
         :main bike.handler}
  :profiles
  {:dev {:dependencies [[javax.servlet/servlet-api "2.5"]
                        [ring-mock "0.1.5"]]}})
