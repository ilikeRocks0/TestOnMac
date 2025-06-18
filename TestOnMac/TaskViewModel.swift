import Foundation
import SwiftUI

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var newTaskName: String = ""

    func addTask() {
        let task = Task(name: newTaskName)
        tasks.append(task)
        newTaskName = ""
    }

    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}
