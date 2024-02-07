class model{
  String? student_name, student_grid,student_standard;

  model({required student_name,required student_grid,required student_standard});

  factory model.fromMap(Map m1){
    model f1=model(
        student_name: m1["student_name"],
        student_grid: m1['student_grid'],
        student_standard: m1['student_standard'],
    );
    return f1;

}

}