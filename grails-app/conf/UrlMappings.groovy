class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
//        "/rest/login"(controller:"display",action: "homePage")
//        "/rest/logout"(controller:"display",action: "homePage")
        "/"(view:"/display/homePage")
        "500"(view:'/error')
	}
}
