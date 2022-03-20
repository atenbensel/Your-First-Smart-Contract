//SPDX-License-Indenifier: GP-3.0
//Prepared by Anna ten Bensel for DevelopHER

pragma solidity >0.4.0 <0.9.0;

contract Scorecard{

    uint256 studentcount = 0;
    address public classTeacher;

    constructor() {
        classTeacher = msg.sender;
    }

    modifier onlyClassTeacher(address _classTeacher) {
        require(classTeacher = _classTeacher, "Only the class teacher has access to this function");
        _;
    }

    struct StudentDetails{
        string studentFirstName;
        string studentLastName;
        uint256 id;
    }

    struct Score{
        uint256 studentId;
        uint256 englishMarks;
        uint256 mathMarks;
        uint256 scienceMarks;
    }

    mapping(uint = StudentDetails) students;

    mapping(uint = Score) scores;

    event studentAdded(string _studentFirstName, string _studentLastName, uint256 _studentId);

    event studentScoreRecorded (uint256 _studentId, uint256 _englishmarks, uint256 _mathMarks, uint256 _scienceMarks);

    function addStudentDetails (string memory _studentFirstName,
                                string memory _studentLastName) public onlyClassTeacher(msg.sender) {

        StudentDetails storage studentObj = students[studentcount];
        studentObj.studentFirstName = _studentFirstName;
        studentObj.studentLastName = _studentLastName;
        studentObj.id = studentcount;
        emit studentAdded(_studentFirstName, _studentLastName, studentcount);
        studentcount++;
    }

    function addStudentScores (uint256 _studentId,
                                uint256 _englishmarks,
                                uint256 _mathMarks,
                                uint256 _scienceMarks) public onlyClassTeacher(msg.sender){
        
        Score storage storeObject = scores[_studentId];

        storeObject.englishMarks = _englishmarks;
        scoreObject.mathMarks = _mathMarks;
        scoreObject.scienceMarks = _scienceMarks;
        emit studentScoreRecorded(_studentId, _englishmarks, _mathMarks, _scienceMarks)
    }
}
