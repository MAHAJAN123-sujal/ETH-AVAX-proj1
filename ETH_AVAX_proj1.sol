// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ETH_AVAX_proj1{
    address public teacher;
    mapping (address =>string) public students;
    mapping (address => bool) public studentExists;
    mapping (address => bool) public attendance;
    mapping (address => uint) public studMarks;

    event StudentAdded(address indexed student, string name);
    event AttendanceRecorded(address indexed student, bool present);
    event MarksAssigned(address indexed student, uint marks);

    constructor(){
        teacher = msg.sender;
    }

    function addStudent(address _student,string memory _name)public{
        require(teacher==msg.sender,"Only teacher can perform these tasks");
        students[_student] = _name;
        attendance[_student] = false; // Initialize attendance as absent
        studMarks[_student] = 0; // Initialize marks
        studentExists[_student] = true;
        emit StudentAdded(_student, _name);
    }

    function recordAttendance(address _student, bool att) public{
        require(studentExists[_student] == true, "Student not registered");
        
        attendance[_student] = att;

        // Assert to make sure attendance is correctly recorded
        assert(attendance[_student] == att);
        emit AttendanceRecorded(_student, att);
    }

    function assignMarks(address _student, uint _marks) public{
        require(studentExists[_student] == true, "Student not registered");
        if(_marks>=0 && _marks<=100){
            studMarks[_student] = _marks;
            // Assert to make sure marks are correctly assigned
            assert(studMarks[_student] == _marks);
            emit MarksAssigned(_student, _marks);
        }
        else{
            revert("Marks are not in correct range");
        }
    }
}
