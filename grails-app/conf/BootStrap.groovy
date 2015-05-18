import com.intelligrape.intellimeet.*

class BootStrap {

    def init = { servletContext ->

        if (!TodoUser.count) {

            TodoUser admin = new TodoUser(username: 'admin', password: 'secret', firstName: "Prashant", lastName: "Sahi", email: "sahiprashant@gmail.com", enabled: true).save()
            TodoUser john = new TodoUser(username: 'john', password: 'secret', firstName: "John", lastName: "Mathews", email: "sahiprashant+2@gmail.com", enabled: true).save()
            TodoUser jane = new TodoUser(username: 'jane', password: 'secret', firstName: "Jane", lastName: "Anderson", email: "sahiprashant5@gmail.com", enabled: true).save()
            TodoRole royalty = new TodoRole(authority: 'ROLE_ROYALTY').save()
            TodoRole common = new TodoRole(authority: 'ROLE_COMMON').save()
            TodoUserTodoRole.create(admin, royalty, true)
            TodoUserTodoRole.create(admin, common, true)
            TodoUserTodoRole.create(john, common, true)
            TodoUserTodoRole.create(jane, common, true)

            TodoGroup todoGroup1 = new TodoGroup(name: "group1", user: admin).save(flush: true, failOnError: true);
            TodoGroup todoGroup2 = new TodoGroup(name: "group2", user: john).save(flush: true, failOnError: true);
            TodoGroup todoGroup3 = new TodoGroup(name: "group3", user: jane).save(flush: true, failOnError: true);

            Todo todo1 = new Todo(task: "task1", collection: todoGroup1)
            todo1.save(flush: true, failOnError: true);
            Todo todo2 = new Todo(task: "task2", collection: todoGroup2)
            todo2.save(flush: true, failOnError: true);
            Todo todo3 = new Todo(task: "task3", collection: todoGroup3)
            todo3.save(flush: true, failOnError: true);
        }
    }
    def destroy = {
    }
}
