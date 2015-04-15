package com.intelligrape.intellimeet

import org.apache.commons.lang.builder.HashCodeBuilder

class TodoUserTodoRole implements Serializable {

    private static final long serialVersionUID = 1

    TodoUser todoUser
    TodoRole todoRole

    boolean equals(other) {
        if (!(other instanceof TodoUserTodoRole)) {
            return false
        }

        other.todoUser?.id == todoUser?.id &&
                other.todoRole?.id == todoRole?.id
    }

    int hashCode() {
        def builder = new HashCodeBuilder()
        if (todoUser) builder.append(todoUser.id)
        if (todoRole) builder.append(todoRole.id)
        builder.toHashCode()
    }

    static TodoUserTodoRole get(long todoUserId, long todoRoleId) {
        TodoUserTodoRole.where {
            todoUser == TodoUser.load(todoUserId) &&
                    todoRole == TodoRole.load(todoRoleId)
        }.get()
    }

    static boolean exists(long todoUserId, long todoRoleId) {
        TodoUserTodoRole.where {
            todoUser == TodoUser.load(todoUserId) &&
                    todoRole == TodoRole.load(todoRoleId)
        }.count() > 0
    }

    static TodoUserTodoRole create(TodoUser todoUser, TodoRole todoRole, boolean flush = false) {
        def instance = new TodoUserTodoRole(todoUser: todoUser, todoRole: todoRole)
        instance.save(flush: flush, insert: true)
        instance
    }

    static boolean remove(TodoUser u, TodoRole r, boolean flush = false) {
        if (u == null || r == null) return false

        int rowCount = TodoUserTodoRole.where {
            todoUser == TodoUser.load(u.id) &&
                    todoRole == TodoRole.load(r.id)
        }.deleteAll()

        if (flush) {
            TodoUserTodoRole.withSession { it.flush() }
        }

        rowCount > 0
    }

    static void removeAll(TodoUser u, boolean flush = false) {
        if (u == null) return

        TodoUserTodoRole.where {
            todoUser == TodoUser.load(u.id)
        }.deleteAll()

        if (flush) {
            TodoUserTodoRole.withSession { it.flush() }
        }
    }

    static void removeAll(TodoRole r, boolean flush = false) {
        if (r == null) return

        TodoUserTodoRole.where {
            todoRole == TodoRole.load(r.id)
        }.deleteAll()

        if (flush) {
            TodoUserTodoRole.withSession { it.flush() }
        }
    }

    static constraints = {
        todoRole validator: { TodoRole r, TodoUserTodoRole ur ->
            if (ur.todoUser == null) return
            boolean existing = false
            TodoUserTodoRole.withNewSession {
                existing = TodoUserTodoRole.exists(ur.todoUser.id, r.id)
            }
            if (existing) {
                return 'userRole.exists'
            }
        }
    }

    static mapping = {
        id composite: ['todoRole', 'todoUser']
        version false
    }
}
