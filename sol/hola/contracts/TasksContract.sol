// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract TasksContract{
    uint public taskCounter=0;
    constructor(){
        createTask("mi primer tarea", "tengo que hacer algo");
    }
    event TaskCreated(
        uint id,
        string title,
        string description,
        bool done,
        uint createdAt
    );

    event TaskToggleDone(uint id, bool done);

    struct Task{
        uint id;
        string title;
        string description;
        bool done;
        uint createdAt;

    }
    mapping (uint  => Task ) public tasks; //recorro cada elemento del al struct

    function createTask(string memory _title, string memory _description) public {
        taskCounter++;
        tasks[taskCounter]=Task(taskCounter, _title, _description, false, block.timestamp);
        emit TaskCreated(taskCounter, _title, _description, false, block.timestamp); //me devueklve el valor de la tarea en el logs
    }//para ver la tarea task.logs[0].args

    function toggleDone(uint _id) public{
        Task memory _task =tasks[_id];
        _task.done = !_task.done;
        tasks[_id]=_task;
        emit TaskToggleDone(_id, _task.done);
    }
}