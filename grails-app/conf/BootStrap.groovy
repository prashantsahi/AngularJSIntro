import com.intelligrape.intellimeet.Todo
import com.intelligrape.intellimeet.TodoGroup

class BootStrap {

    def init = { servletContext ->
        if (TodoGroup.count()==0) {
            TodoGroup todoGroup1 = new TodoGroup(name: "group1").save(flush: true, failOnError: true);
            TodoGroup todoGroup2 = new TodoGroup(name: "group2").save(flush: true, failOnError: true);
            TodoGroup todoGroup3 = new TodoGroup(name: "group3").save(flush: true, failOnError: true);

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
