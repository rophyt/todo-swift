import SwiftUI
import Amplify
import AmplifyPlugins

struct TodoRow: View {
    var todo: TodoItem
    
    var body: some View {
        Text(todo.name)
    }
}

struct TodoItem: Identifiable {
    var id = UUID()
    var name: String
}

struct ContentView: View {

    var body: some View {
        var todoRows = [] as [TodoItem]
        Amplify.DataStore.query(Todo.self) { result in
            switch(result) {
            case .success(let todos):
                for todo in todos {
                    todoRows.append(TodoItem(name: todo.name))
                    print("==== Todo ====")
                    print("Name: \(todo.name)")
                    if let priority = todo.priority {
                        print("Priority: \(priority)")
                    }
                    if let description = todo.description {
                        print("Description: \(description)")
                    }
                }
            case .failure(let error):
                print("Could not query DataStore: \(error)")
            }
        }
        return List(todoRows) { todoRow in
            TodoRow(todo: todoRow)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
