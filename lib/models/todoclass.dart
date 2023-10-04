class ToDo {
  String? id;
  String? todorText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todorText,
    this.isDone = false,
  });

  static List<ToDo> todoLists() {
    return [
      ToDo(id: "01", todorText: "Morning tea", isDone: true),
      ToDo(id: "02", todorText: "After dinear", isDone: true),
      ToDo(
        id: "03",
        todorText: "Check email",
      ),
      ToDo(
        id: "04",
        todorText: "Gym working",
      ),
      ToDo(
        id: "05",
        todorText: "lunch home",
      ),
      ToDo(
        id: "06",
        todorText: "Sleeping time",
      )
    ];
  }
}
