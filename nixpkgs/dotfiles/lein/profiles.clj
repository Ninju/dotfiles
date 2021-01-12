{:repl {:dependencies [[nrepl "0.6.0"]
                       [spyscope "0.1.6"]
                       [vvvvalvalval/scope-capture "0.3.2"]
                       [org.clojure/tools.trace "0.7.10"]
                       [pjstadig/humane-test-output "0.8.0"]
                       [criterium "0.4.5"]]
        :injections [;; (require 'sc.api)
                     (require 'spyscope.core)
                     (use 'clojure.tools.trace)
                     (require 'pjstadig.humane-test-output)
                     (pjstadig.humane-test-output/activate!)]
        :plugins [[cider/cider-nrepl "0.22.0-beta2"]
                  [refactor-nrepl "2.4.0"]]}
 :user {:dependencies []
        :injections []}}
