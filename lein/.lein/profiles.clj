{:user {:plugins [[venantius/ultra "0.4.1"]
                  [lein-kibit "0.1.2"]
                  [lein-auto "0.1.2"]
                  [cider/cider-nrepl "0.14.0"]
                  [lein-drip "0.1.1-SNAPSHOT"]
                  [lein-midje "3.1.3"]]
        :dependencies [[org.clojure/tools.namespace "0.3.0-alpha3"]]
        :injections [(require '[clojure.tools.namespace.repl :refer [refresh]])]}}
