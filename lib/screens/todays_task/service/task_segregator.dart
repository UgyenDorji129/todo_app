Map<String, dynamic> segregateTasks(List<Map<String, dynamic>> todaysTasks) {
  Map<String, List<Map<String, dynamic>>> categorizedTasks = {
    "inProgress": [],
    "todo": [],
    "done": []
  };

  for (var task in todaysTasks) {
    switch (task["status"]) {
      case "In Progress":
        categorizedTasks["inProgress"]?.add(task);
        break;
      case "Pending":
        categorizedTasks["todo"]?.add(task);
        break;
      case "Done":
        categorizedTasks["done"]?.add(task);
        break;
    }
  }

  return categorizedTasks;
}
