class DeleteTask {
  static String deleteJson = """

   mutation(\$todoId : Int!) {
  deleteTodo(todoId: \$todoId) {
    id
    status
    task
  }
} 

  """;
}