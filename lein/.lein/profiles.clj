{:user {:plugins [[venantius/ultra "0.4.1"]
                  [lein-kibit "0.1.2"]
                  [lein-auto "0.1.2"]
                  [cider/cider-nrepl "0.14.0"]
                  [lein-drip "0.1.1-SNAPSHOT"]
                  [lein-midje "3.1.3"]]
        :dependencies [[org.clojure/tools.namespace "0.3.0-alpha3"]]
        :injections [(require '[clojure.tools.namespace.repl :refer [refresh]])]}

 ;; A profile to make my repl do all kinds of awesome stuff
 :repl {;; Dependencies used by the injections below
        :dependencies [;; Inject stuff into a namespace
                       [im.chit/lucid.core.inject "1.2.0"]
                       ;; Print stuff really pretty
                       [aprint "0.1.3"]
                       ;; Extended docs
                       [thalia "0.1.0"]]
        ;; Everything inside this will be evaluated before every lein task expect "jar" and "uberjar"
        :injections [(use '[lucid.core.inject]
                          '[thalia.doc])
                     ;; Inject some stuff so it will be accessable everywhere
                     (lucid.core.inject/in
                      clojure.core >
                      ;; aprint for pretty printing things
                      [aprint.core aprint ap])

                     ;; Enable thalia extended docs
                     (thalia.doc/add-extra-docs! :language "en_US")]}}
