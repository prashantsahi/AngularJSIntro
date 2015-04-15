package com.intelligrape.intellimeet

import grails.rest.Resource

@Resource(uri = "/rest/api/todoUser", formats = ['json', 'xml'])
class TodoUser {

    transient springSecurityService

    String username
    String password
    String firstName
    String lastName
    String email
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    static hasMany = [todoGroups: TodoGroup]

    static transients = ['springSecurityService']

    static constraints = {
        username blank: false, unique: true
        password blank: false
        email email: true, blank: false
    }

    static mapping = {
        password column: '`password`'
    }

    Set<TodoRole> getAuthorities() {
        TodoUserTodoRole.findAllByTodoUser(this).collect { it.todoRole }
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
    }
}
