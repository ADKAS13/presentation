const iteratorC = '''
void iteratorFunction()
{
    char fruits[3][7] = {"apple", "banana", "orange"};
    for (int i = 0; i < sizeof(fruits) / sizeof(fruits[0]); i++)
    {
        printf("%s\\n", fruits[i]);
    }
}
''';

const iteratorPython = '''
def iteratorFunction():
  fruits = ["apple", "banana", "orange"]

  for fruit in fruits:
    print(fruit)
''';

const arraysC = '''#include <stdio.h>

void updateArray(int arr[], int size) {
    for (int i = 0; i < size; i++){
        if (i % 2 == 0) {
            arr[i] += 1;
        } else {
            arr[i] -= 1;
        }
    }
}

void printArray(int arr[], int size) {
    for (int i = 0; i < size; i++) {
        printf("%i ", arr[i]);
    }
}

int main(int argc, char *argv) {
    int arr[] = {3, 1, 4, 5, 9, 2, 6};
    int size = sizeof(arr) / sizeof(arr[0]);
    updateArray(arr, size);
    printArray(arr, size);
}''';

const pointerC = '''
void pointerFunction()
{
    int value = 10;
    int *intPointer = &value;

    printf("%p\\n", intPointer);
    printf("%i\\n", *intPointer);
}
''';

const pointerC_Options = [
  '''0x7ffd81e03e7c
10
''',
  '''
10
0x7ffd81e03e7c
''',
  '''
10, 0x7ffd81e03e7c
'''
];

const mapC = '''int getIndex(char key[])
{
    for (int i = 0; i < size; i++)
    {
        if (strcmp(keys[i], key) == 0)
        {
            return i;
        }
    }
    return -1; // Key not found
}

void insert(char key[], double value)
{
    int index = getIndex(key);
    if (index == -1)
    { // Key not found
        strcpy(keys[size], key);
        values[size] = value;
        size++;
    }
    else
    { // Key found
        values[index] = value;
    }
}

int get(char key[])
{
    int index = getIndex(key);
    if (index == -1)
    { // Key not found
        return -1;
    }
    else
    { // Key found
        return values[index];
    }
}

void printStructure()
{
    for (int i = 0; i < size; i++)
    {
        printf("%s: %d\\n", keys[i], values[i]);
    }
}

int main(int argc, char **argv)
{
    insert("John", 1234567890);
    insert("Mary", 246891012);
    insert("Peter", 987654321);

    printStructure();
}


''';

const evalReprPython = '''number = 10

function = eval("number * 3 + 8")

print(repr(function))
''';

const mapPowEnumPython = '''numbers = [5, 3, 1, 2]

def multiply(x):
  return x + 5

result = map(multiply, numbers)
newResult1 = []
newResult2 = []
for x, y in enumerate(result):
  newResult1.append(eval("pow(y, 2)"))
  newResult2.append(eval("pow(x, 2)"))
print(newResult1)
print(newResult2)
 ''';

const builtInsPython = '''
data = [2, 3.5, 'hello', [1, 2, 3], {'a': 1, 'b': 2}, 4.5, 'world', 6, 7]

filtered_data = list(filter(lambda x: isinstance(x, int), data))
sorted_data = sorted(filtered_data, reverse=True)
squared_data = list(map(lambda x: x**2, sorted_data))
unique_squared_data = set(squared_data)
result = sum(unique_squared_data)

print(result)
''';

const structsC = '''#include <stdio.h>
#include <string.h>

struct Student 
{
    char name[50];
    int age;
    double gpa;
};

void updateGPA(struct Student *student, double newGPA) 
{
    student->gpa = newGPA;
}

void printStudent(struct Student student) 
{
    printf("%s, %d, %.1f\\n", student.name, student.age, student.gpa);
}

int main() 
{
    struct Student alice = {"Alice", 20, 3.5};

    struct Student students[3] = 
    {
        {"Bob", 22, 3.8},
        alice,
        {"Charlie", 19, 3.2}
    };

    updateGPA(&students[1], 3.9);

    for (int i = 0; i < 3; i++) 
    {
        printStudent(students[i]);
    }

    return 0;
}
''';

const pointerAdvancedC = '''#include <stdio.h>

void modifyArray(int *arr, int size) {
    for (int i = 0; i < size; i++) {
        *(arr + i) = *(arr + i) * 2;
    }
}

void swap(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

int main() {
    int numbers[] = {1, 2, 3, 4, 5};
    int *ptr = numbers;
    
    modifyArray(ptr, 5);

    swap(&numbers[0], &numbers[4]);

    for (int i = 0; i < 5; i++) {
        printf("%d ", *(ptr + i));
    }

    return 0;
}

''';

const memoryManagementC = '''#include <stdio.h>
#include <stdlib.h>

void fillArray(int *arr, int size) {
    for (int i = 0; i < size; i++) {
        *(arr + i) = i * 2;
    }
}

void updateArray(int **arr, int old_size, int new_size) {
    *arr = (int *)realloc(*arr, new_size * sizeof(int));
    for (int i = old_size; i < new_size; i++) {
        *(*arr + i) = i * 3;
    }
}

int main() {
    int size = 5;

    int *numbers = (int *)malloc(size * sizeof(int));
    if (numbers == NULL) {
        printf("Memory allocation failed\\n");
        return 1;
    }

    fillArray(numbers, size);

    int new_size = 8;
    updateArray(&numbers, size, new_size);

    for (int i = 0; i < new_size; i++) {
        printf("%d ", *(numbers + i));
    }

    free(numbers);

    return 0;
}

''';

const objectFunctionsPython = '''class Base:
    def __init__(self, value):
        self.value = value

    def double(self):
        self.value *= 2

    def __str__(self):
        return f"Base: {self.value}"

class Derived(Base):
    def __init__(self, value, increment):
        super().__init__(value)
        self.increment = increment

    def double(self):
        self.value = self.value * 2 + self.increment

    def __str__(self):
        return f"Derived: {self.value}, Increment: {self.increment}"

def process(objects):
    for obj in objects:
        obj.double()
        print(obj)

b1 = Base(10)
d1 = Derived(5, 3)
b2 = Base(7)
d2 = Derived(2, 4)

objects = [b1, d1, b2, d2]

process(objects)
''';

const objectFunctionsAdvancedPython = '''class A:
    def __init__(self, value):
        self.value = value

    def compute(self):
        return self.value * 2

    def __str__(self):
        return f"A: {self.value}"

class B(A):
    def __init__(self, value, extra):
        super().__init__(value)
        self.extra = extra

    def compute(self):
        return super().compute() + self.extra

    def __str__(self):
        return f"B: {self.value}, Extra: {self.extra}"

class C(A):
    def __init__(self, value):
        super().__init__(value)
        self.nested = self.Nested(value)

    class Nested:
        def __init__(self, value):
            self.value = value

        def nested_compute(self):
            return self.value ** 2

def create_closure(base_value):
    def inner(multiplier):
        return base_value * multiplier
    return inner

class D(B, C):
    def __init__(self, value, extra, multiplier):
        B.__init__(self, value, extra)
        C.__init__(self, value)
        self.closure = create_closure(self.value)
        self.multiplier = multiplier

    def compute(self):
        return self.closure(self.multiplier) + self.extra

    def __str__(self):
        return f"D: {self.value}, Extra: {self.extra}, Multiplier: {self.multiplier}"

# Initialize objects
a = A(3)
b = B(4, 5)
c = C(2)
d = D(3, 4, 2)

# Create a mixed list of objects
objects = [a, b, c, d]

# Compute and print results
for obj in objects:
    print(f"{obj} -> Compute: {obj.compute()}")

# Print nested compute results for objects of type C and its subclasses
for obj in objects:
    if isinstance(obj, C):
        print(f"{obj} -> Nested Compute: {obj.nested.nested_compute()}")

''';

const objectFunctionsAdvancedPythonOptions = [
  '''A: 3 -> Compute: 6
B: 4, Extra: 5 -> Compute: 13
A: 2 -> Compute: 4
D: 3, Extra: 4, Multiplier: 2 -> Compute: 10
A: 2 -> Nested Compute: 4
D: 3, Extra: 4, Multiplier: 2 -> Nested Compute: 6
''',
  '''A: 3 -> Compute: 6
B: 4, Extra: 5 -> Compute: 13
A: 2 -> Compute: 4
D: 3, Extra: 4, Multiplier: 2 -> Compute: 10
A: 2 -> Nested Compute: 4
D: 3, Extra: 4, Multiplier: 2 -> Nested Compute: 9
''',
  '''A: 3 -> Compute: 6
B: 4, Extra: 5 -> Compute: 13
A: 2 -> Compute: 4
D: 3, Extra: 4, Multiplier: 2 -> Compute: 10
C: 2 -> Nested Compute: 4
D: 3, Extra: 4, Multiplier: 2 -> Nested Compute: 9
'''
];

class Question {
  final bool isMultipleChoice;
  final String questionText;
  final String answer;
  Question(
      {required this.questionText,
      required this.isMultipleChoice,
      required this.answer});
}

class MultipleChoiceQuestion extends Question {
  final String optionA;
  final String optionB;
  final String optionC;
  final String optionD;

  MultipleChoiceQuestion(
      {required super.questionText,
      required super.answer,
      super.isMultipleChoice = true,
      required this.optionA,
      required this.optionB,
      required this.optionC,
      this.optionD = "I don't know"});
}

var staticQuestions = [
  Question(questionText: iteratorC, isMultipleChoice: false, answer: '''apple
banana
orange
'''),
  MultipleChoiceQuestion(
    questionText: pointerC,
    isMultipleChoice: true,
    answer: "A",
    optionA: pointerC_Options[0],
    optionB: pointerC_Options[1],
    optionC: pointerC_Options[2],
  ),
  Question(
      questionText: structsC, isMultipleChoice: false, answer: '''Bob, 22, 3.8
Alice, 20, 3.9
Charlie, 19, 3.2
'''),
  Question(
      questionText: mapC, isMultipleChoice: false, answer: '''John: 1234567890
Mary: 246891012
Peter: 987654321
'''),
  Question(
      questionText: pointerAdvancedC,
      isMultipleChoice: false,
      answer: '''10 4 6 8 2 '''),
  Question(
      questionText: arraysC, isMultipleChoice: false, answer: '4 0 5 4 10 1 7 '),
  Question(
      questionText: memoryManagementC,
      isMultipleChoice: false,
      answer: '''0 2 4 6 8 15 18 21'''),
];

var dynamicQuestions = [
  Question(
      questionText: iteratorPython, isMultipleChoice: false, answer: '''apple
banana
orange'''),
  Question(
      questionText: evalReprPython, isMultipleChoice: false, answer: '''38'''),
//   Question(
//       questionText: mapPowEnumPython,
//       isMultipleChoice: false,
//       answer: '''[100, 64, 36, 49]
// [0, 1, 4, 9]'''),
  Question(
      questionText: builtInsPython, isMultipleChoice: false, answer: '''89'''),
  Question(
      questionText: objectFunctionsPython,
      isMultipleChoice: false,
      answer: '''Base: 20
Derived: 13, Increment: 3
Base: 14
Derived: 8, Increment: 4'''),
  MultipleChoiceQuestion(
      questionText: objectFunctionsAdvancedPython,
      optionA: objectFunctionsAdvancedPythonOptions[0],
      optionB: objectFunctionsAdvancedPythonOptions[1],
      optionC: objectFunctionsAdvancedPythonOptions[2],
      answer: "B")
];
