# ETH_AVAX_proj1

This contract implements a simple teacher-student management system where the teacher (owner of the contract) can add students, record attendance, and assign marks. It includes functions with conditions checked using `require`, `assert`, and `revert` statements.

## Description

The `ETH_AVAX_proj1` contract is a basic implementation of a student management system on the Ethereum blockchain. It includes the following functionalities:

- Adding students to the class.
- Recording student attendance.
- Assigning marks to students.
- A mapping to keep track of students' names, attendance, and marks.

## Contract Details

The `ETH_AVAX_proj1` smart contract is written in Solidity and includes the following key components:

### State Variables

- `address public teacher`: Stores the address of the contract owner (teacher).
- `mapping(address => string) public students`: A mapping to store student names by their address.
- `mapping(address => bool) public studentExists`: A mapping to check if a student is registered.
- `mapping(address => bool) public attendance`: A mapping to keep track of student attendance (true for present, false for absent).
- `mapping(address => uint) public studMarks`: A mapping to store student marks.

### Events

- `event StudentAdded(address indexed student, string name)`: Emitted when a new student is added.
- `event AttendanceRecorded(address indexed student, bool present)`: Emitted when attendance is recorded.
- `event MarksAssigned(address indexed student, uint marks)`: Emitted when marks are assigned to a student.

### Constructor

The constructor initializes the contract by setting the teacher's address:

```solidity
constructor() {
    teacher = msg.sender;
}
```

### Functions

#### Add Student

The `addStudent` function allows the teacher to add a new student by providing their address and name:

```solidity
function addStudent(address _student, string memory _name) public {
    require(teacher == msg.sender, "Only teacher can perform these tasks");
    require(!studentExists[_student], "Student already added");
    require(bytes(_name).length > 0, "Invalid student name");

    students[_student] = _name;
    attendance[_student] = false; // Initialize attendance as absent
    studMarks[_student] = 0; // Initialize marks
    studentExists[_student] = true;
    emit StudentAdded(_student, _name);
}
```

#### Record Attendance

The `recordAttendance` function allows the teacher to record a student's attendance:

```solidity
function recordAttendance(address _student, bool att) public {
    require(teacher == msg.sender, "Only teacher can perform these tasks");
    require(studentExists[_student], "Student not registered");
    
    attendance[_student] = att;

    // Assert to make sure attendance is correctly recorded
    assert(attendance[_student] == att);
    emit AttendanceRecorded(_student, att);
}
```

#### Assign Marks

The `assignMarks` function allows the teacher to assign marks to a student:

```solidity
function assignMarks(address _student, uint _marks) public {
    require(teacher == msg.sender, "Only teacher can perform these tasks");
    require(studentExists[_student], "Student not registered");
    if (_marks >= 0 && _marks <= 100) {
        studMarks[_student] = _marks;
        // Assert to make sure marks are correctly assigned
        assert(studMarks[_student] == _marks);
        emit MarksAssigned(_student, _marks);
    } else {
        revert("Marks are not in correct range");
    }
}
```

### View Functions

The following functions allow anyone to view the details of a student:

- `viewAttendance`: Returns the attendance status of a student.
- `viewMarks`: Returns the marks of a student.
- `getStudentName`: Returns the name of a student.

```solidity
function viewAttendance(address _student) public view returns (bool) {
    require(studentExists[_student], "Student not registered");
    return attendance[_student];
}

function viewMarks(address _student) public view returns (uint) {
    require(studentExists[_student], "Student not registered");
    return studMarks[_student];
}

function getStudentName(address _student) public view returns (string memory) {
    require(studentExists[_student], "Student not registered");
    return students[_student];
}
```

## Deployment

To deploy the `ETH_AVAX_proj1` smart contract, you can use Remix IDE.

### Using Remix

1. Open [Remix](https://remix.ethereum.org/).
2. In the Contracts folder, create a new file and paste the contract code into the editor.
3. Compile the contract using Ctrl+S.
4. Deploy the contract to the desired Ethereum network.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.

## Authors

Sujal Mahajan

## Contributing

Contributions are welcome! Feel free to submit changes or improvements.

---

This README provides a comprehensive guide to understanding, deploying, and using the `ETH_AVAX_proj1` smart contract.
