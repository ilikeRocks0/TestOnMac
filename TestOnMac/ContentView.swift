import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TaskViewModel()

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter a new task", text: $viewModel.newTaskName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button(action: viewModel.addTask) {
                        Image(systemName: "plus")
                    }
                    .disabled(viewModel.newTaskName.isEmpty)
                }
                .padding()

                List {
                    ForEach(viewModel.tasks) { task in
                        Text(task.name)
                    }
                    .onDelete(perform: viewModel.deleteTask)
                }
            }
            .navigationTitle("To-Do List")
        }
    }
}
