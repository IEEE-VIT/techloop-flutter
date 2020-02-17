
class Task {
  String title;
  String priority;
  double indicatorValue;

  Task({this.title, this.priority, this.indicatorValue});
}

List<Task>getTasks = [ 
  Task(
    title: "Pick up laundry",
    priority: "High",
    indicatorValue: 1,
    ),
  Task(
    title: "Get watch repaired",
    priority: "Medium",
    indicatorValue: 0.66,
    ),
  Task(
    title: "Finish Stats DA",
    priority: "High",
    indicatorValue: 1,
  ),
  Task(
    title: "Study for DLD quiz",
    priority: "Medium",
    indicatorValue: 0.66,
  ),
  Task(
    title: "Buy fruits and almonds",
    priority: "Low",
    indicatorValue: 0.33,
  ),
  Task(
    title: "Get a girlfriend",
    priority: "High",
    indicatorValue: 1.0,
  ),
  Task(
    title: "Prepare for project review",
    priority: "Low",
    indicatorValue: 0.3,
  ),
  Task(
    title: "Ask dad for money",
    priority: "High",
    indicatorValue: 1,
  ),
];