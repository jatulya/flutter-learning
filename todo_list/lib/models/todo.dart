class Todo  {
    final int id;
    final String name;
    final String description;
    final bool status;

    const Todo ({
      required this.id,
      required this.name,
      required this.description,
      this.status = false,
    });

    Todo toggleCompletion (){
      return Todo(
        id: id,
        name:  name,
        description: description,
        status: !status,
      );
    }
}
