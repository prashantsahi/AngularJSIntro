package com.intelligrape.intellimeet

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.rest.Resource

@Secured('permitAll')
@Resource(uri = "/rest/api/group", formats = ['json', 'xml'])
class TodoGroup {
    String ownedBy = "Sahi"
    String name

    static hasMany = [todos: Todo]
    static belongsTo = [user:TodoUser]

    static mapping = {
//        todos fetch: 'join'
        todos lazy: false
    }

    /* JSON toJSON(json) {
         json.build {
             ownedBy(ownedBy)
             name(name)
             todos(todos)
         }
     }*/

}
