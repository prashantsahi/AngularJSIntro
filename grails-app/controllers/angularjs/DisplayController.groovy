package angularjs

import com.intelligrape.intellimeet.TodoRole
import com.intelligrape.intellimeet.TodoUser
import com.intelligrape.intellimeet.TodoUserTodoRole
import grails.plugin.springsecurity.LoginController
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.security.access.annotation.Secured


@Secured(['permitAll'])
class DisplayController extends LoginController {
def springSecurityService
    def homePage() {
        render(view: "homePage")
        println("from homepage")
        println "----------------------------------------------------->>>>>>>>>>>>>>>>>"+params
    }

    def register() {
        println("from register page :" + params)
        TodoUser todoUser = new TodoUser();
        todoUser.properties = params
        todoUser.save(flush: true, failOnError: true)

        TodoRole common = TodoRole.findByAuthority('ROLE_COMMON')
        TodoUserTodoRole.create(todoUser, common, true)
        redirect(action: "homePage");
    }

    /*def app() {
        render(view: "/app")
    }
*/
  def demoReview(){
      println("from demoReview");
      render(view: '/display/demoReview')
  }

    def index() {
        if (springSecurityService.isLoggedIn()) {isLoggedIn
            println "from index: user logged in"
            redirect uri: SpringSecurityUtils.securityConfig.successHandler.defaultTargetUrl

        } else {
            print "from index ---->  user not logged in"
            redirect action: 'auth', params: params
        }
    }

    /**
     * Show the login page.
     */
    def auth() {
        print "from auth ---->  user not logged in"

        def config = SpringSecurityUtils.securityConfig

/*        if (springSecurityService.isLoggedIn()) {
            redirect uri: config.successHandler.defaultTargetUrl
            return
        }*/

        String view = '/display/homePage'
        String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
        render view: view, model: [postUrl            : postUrl,
                                   rememberMeParameter: config.rememberMe.parameter]
    }
}
