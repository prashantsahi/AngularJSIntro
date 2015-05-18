package angularjs

class AppFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
                println "Controller : ${controllerName}, Action : ${actionName}"
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
