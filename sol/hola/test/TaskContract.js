const TasksContract= artifacts.require("TasksContract")
contract("TasksContract",()=>{
    before(async ()=>{
        this.tasksContract= await TasksContract.deployed()
    })

    it('migrate deployed succefully',async()=>{
        const address= this.tasksContract.address;
        assert.notEqual(address,null);
        assert.notEqual(address,undefined);
        assert.notEqual(address,0x0);
        assert.notEqual(address,"");
    })

    it('get task list',async()=>{
        const tasksCounter= await this.tasksContract.taskCounter();
        const task= await this.tasksContract.tasks(tasksCounter);
        
        assert.equal(task.id.toNumber(), tasksCounter)
        assert.equal(task.title, "mi primer tarea")
        assert.equal(task.description, "tengo que hacer algo")
        assert.equal(task.done, false)
        assert.equal(tasksCounter, 1)
    })

    it('task create succefully',async()=>{
        const result = await this.tasksContract.createTask("some task","description two");
        const taskEvent= result.logs[0].args;
        const TaskCounter= await this.tasksContract.taskCounter();

        assert.equal(TaskCounter, 2)
        assert.equal(taskEvent.id.toNumber(), 2);
        assert.equal(taskEvent.title, "some task");
        assert.equal(taskEvent.description, "description two");
        assert.equal(taskEvent.done, false);
    })

    it('task toogle done', async ()=>{
        const result= await this.tasksContract.toggleDone(1);
        const TaskEvent=result.logs[0].args;
        const task = await this.tasksContract.tasks(1)

        assert.equal(task.done, true);
        assert.equal(TaskEvent.done, true);
        assert.equal(TaskEvent.id, 1);

    })
})