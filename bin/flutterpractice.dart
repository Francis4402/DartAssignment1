abstract class Role {
    void displayRole();
}

class Person implements Role {
    String _name;
    int _age;
    String _address;
    Role role;

    Person(this._name, this._age, this._address, this.role);

    String get getName => _name;
    int get getAge => _age;
    String get getAddress => _address;

    @override
    void displayRole(){
        print("Role: ${role.runtimeType}");
    }
}

class StudentRole implements Role {
    @override
    void displayRole() {
        print("Role: Student");
    }
}

class TeacherRole implements Role {
    @override
    void displayRole() {
        print("Role: Teacher");
    }
}

class Student extends Person {
    int _studentID;
    String _grade;
    List<int> _courseScores = [];


    Student(String name, int age, String address, Role role, this._studentID, this._grade)
        : super(name, age, address, role);

    @override
    void displayRole() {
        role.displayRole();
    }

    double calculateAverageScore() {
        if (_courseScores.isEmpty) {
            return 0.0;
        } else {
            double sum = _courseScores.reduce((a, b) => a + b).toDouble();
            return sum / _courseScores.length;
        }
    }
}

class Teacher extends Person {
    int _teacherID;
    List<String> _coursesTaught = [];

    Teacher(String name, int age, String address, Role role, this._teacherID)
        : super(name, age, address, role);

    @override
    void displayRole() {
        print("Role: Teacher");
    }

    int get teacherID => _teacherID;

    void displayCoursesTaught() {
        if (_coursesTaught.isEmpty) {
            print("No courses taught by this teacher.");
        } else {
            print("Courses Taught:");
            for (String course in _coursesTaught) {
                print("- $course");
            }
        }
    }

    void addCourseTaught(String course) {
        _coursesTaught.add(course);
    }
}

void main() {
    Student student = Student("John Doe", 20, "123 Main Street", StudentRole() ,123456, "Sophomore");
    Teacher teacher = Teacher('Mrs.Smith', 35, "456 Oak St.", TeacherRole(), 232123);

    print("Name: ${student.getName}");
    print("Age: ${student.getAge}");
    print("Address: ${student.getAddress}");
    print("StudentID: ${student._studentID}");

    student.displayRole();

    student._courseScores = [90, 85, 82];

    double grade = student.calculateAverageScore();
    print("Grade: $grade");

    print("Name: ${teacher.getName}");
    print("Age: ${teacher.getAge}");
    print("Address: ${teacher.getAddress}");
    print("StudentID: ${teacher._teacherID}");
    teacher.displayRole();

    teacher.addCourseTaught("Math");
    teacher.addCourseTaught("English");
    teacher.addCourseTaught("Bangla");

    teacher.displayCoursesTaught();
}