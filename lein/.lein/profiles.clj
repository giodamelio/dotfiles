{:user {:plugins [;; A Leiningen plugin for a superior development environment
                  ;; Includes colorful repl
                  ;; Better core.test output
                  ;; Better stacktraces
                  [venantius/ultra "0.4.1"]

                  ;; Static code analyzer
                  [lein-kibit "0.1.2"]

                  ;; Auto run lein tasks when files are changed
                  [lein-auto "0.1.2"]

                  ;; nREPL middleware to enhance CIDER
                  [cider/cider-nrepl "0.14.0"]

                  ;; Use drip for faster startup (maybe?)
                  [lein-drip "0.1.1-SNAPSHOT"]

                  ;; Midje test runner
                  [lein-midje "3.1.3"]

                  ;; Code coverage
                  [lein-cloverage "1.0.9"]

                  ;; Linter
                  [jonase/eastwood "0.2.4"]

                  ;; A Leiningen plugin designed to tell you your code is bad, and that you should feel bad.
                  [lein-bikeshed "0.4.1"]

                  ;; Check your project for outdated dependencies and plugins
                  [lein-ancient "0.6.10"]

                  ;; Try new modules easily
                  [lein-try "0.4.3"]]

        ;; Dependencies used by the injections below
        :dependencies [;; Manage namespaces (mostly for refresh)
                       [org.clojure/tools.namespace "0.3.0-alpha3"]

                       ;; Inject stuff into a namespace
                       [im.chit/lucid.core.inject "1.3.6"]

                       ;; Extended docs
                       [thalia "0.1.0"]

                       ;; Trace based debugging
                       [spyscope "0.1.5"]]

        ;; Everything inside this will be evaluated before every lein task expect "jar" and "uberjar"
        :injections [;; Setup spyscope
                     (require 'spyscope.core)

                     ;; Load some deps
                     (use ['lucid.core.inject]
                          ['thalia.doc])

                     ;; Inject some functions into some namespaces
                     (lucid.core.inject/in
                      ;; Inject into clojure.core so it is aviable everywhere
                      clojure.core

                      ;; Make sure doc and source are always aviable
                      [clojure.repl doc source]

                      ;; Inject into > namespace
                      >

                      ;; Easy namespace refresh
                      [clojure.tools.namespace.repl refresh [refresh r]]

                      ;; Colorful printing
                      [puget.printer pprint [pprint pp] cprint [cprint cp]]

                      ;; Easly run shell commands
                      [clojure.java.shell sh])

                     ;; Enable thalia extended docs
                     (thalia.doc/add-extra-docs! :language "en_US")] 

        ;; Create some aliaes
        :aliases {"omni-check" ["do" ["clean"] ["ancient"] ["kibit"] ["bikeshed"]]}}}
