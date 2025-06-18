import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    let name: String
}

struct ContentView: View {
    @State private var tasks: [Task] = []
    @State private var newTaskName = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter a new task", text: $newTaskName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: addTask) {
                        Image(systemName: "plus")
                    }
                    .disabled(newTaskName.isEmpty)
                }
                .padding()

                List {
                    ForEach(tasks) { task in
                        Text(task.name)
                    }
                    .onDelete(perform: deleteTask)
                }
            }
            .navigationTitle("To-Do List")
        }
    }

    func addTask() {
        let task = Task(name: newTaskName)
        tasks.append(task)
        newTaskName = ""
    }

    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}
