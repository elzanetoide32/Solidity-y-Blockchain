
App={
    contracts:[],
    init:async ()=>{
        console.log("loaded")
        await App.loadEth()
        await App.loadAccount()
        await App.loadContracts()
        App.render()
        await App.renderTask()
    },
    loadEth: async ()=>{
        if(window.ethereum){
            App.web3Provider=window.ethereum;
            console.log("eth exist");
            await window.ethereum.request({method: 'eth_requestAccounts'})
        }else if(window.web3){
            web3 =new Web3(windoq.web3.currentProvider)
        }
        else{
            alert("Etherum no esta instalado, instalelo para continuar")
        }
    },
    loadAccount:async()=>{
       const accounts= await window.ethereum.request({method: 'eth_requestAccounts'})
        App.account=accounts[0]    
    },
    loadContracts: async()=>{
        const res= await fetch("TasksContract.json")
        const taskjson= await res.json()

        App.contracts.tasksContract= TruffleContract(taskjson);
        App.contracts.tasksContract.setProvider(App.web3Provider)
        App.tasksContract= await App.contracts.tasksContract.deployed()
    },
    render: ()=>{
        document.getElementById('account').innerText=App.account
    },
    renderTask:async ()=>{
        const taskCounter= await App.tasksContract.tasksCounter()
        const taskCounterNum=taskCounter.toNumber()
        console.log(taskCounterNum)

        let html=''
        for(let i=0; i<taskCounterNum ;i++){
           const task =await App.taskContract.tasks(i)
           const taskId=task[0]
           const taskTitle=task[1]
           const taksDescription=task[2]
           const taskDone= task[3]
           const taskCreated= task[4]
           let taskElement=`
           <div class="card bg-dark rounded-0 mb-2">
                <div class="card-header d-flex justify-content-between aling-items-center">
                    <span>${taskTitle}</span>
                    <div class="form-check form-switch">
                        <input class="form-chech-input" data-id="${taskId}" type="checkbox" ${taskDone && "checked"}
                        onchenged="App.toggleDone(this)"
                        />                        
                    </div>

                </div>
                <div class="card-body">
                    <span>${taksDescription}</span>
                    <p class="text-muted">TaskCreated ${new Date(taskCreated*1000) .toLocaleString()}</p>
                </div>
           </div>
           `
           html +=taskElement
        }
        document.querySelector("#taskList").innerHTML=html
    },
    createTask:async(title, description)=>{
        const result= await App.tasksContract.createTask(title,description,{
            from:App.account
        });
        console.log(result.logs[0].args)
    },
    toggleDone: async (Element)=>{
        const taskId= Element.dataset.id
        await App.tasksContract.toggleDone(taskId,{
            from:App.account
        });      
        window.location.reload()
    }
}

App.init()