package com.intelligrape.intellimeet

import grails.converters.JSON
import grails.rest.Resource

@Resource(uri = "/api/group", formats = ['json', 'xml'])
class TodoGroup {
    String ownedBy = "Sahi"
    String name

    static hasMany = [todos: Todo]

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
