// SPDX-License-Identifier: MIT
pragma solidity >=0.8.1;

// contract Coin{
//     address public minter;
//     mapping(address=>uint)public balances;

//     event Sent(address from, address to, uint amount);
//     constructor(){
//         minter=msg.sender;
//     }
//     //envia cantidad de moneda creada a la direccion especifica
//     function mint(address receiver, uint amount)public{
//         require(msg.sender==minter);
//         balances[receiver]+=amount;
//     }
//     error InsufficientBalance(uint requested, uint available);

//     ///enviar moneda existente
//     function send(address receiver, uint amount)public{
//         if(amount>balances[msg.sender]){
//             revert InsufficientBalance({
//                 requested:amount,
//                 available:balances[msg.sender]
//             });
//         }
//         balances[msg.sender]-=amount;
//         balances[receiver]+=amount;
//         emit Sent(msg.sender, receiver, amount);
//     }
// }

///para tener seguridad en el contrato se debe tener estas 3 funciones como minimo

// function sendReFund() public onlyOwner returns (bool success){
//     if(!persona.send(amount)){
//         ////hacer algo
//     }


//     function claimRefund() public{
//         require(balance[msg.sender]>0);
//         msg.sender.transfer(balance[msg.sender]);
//     }

//     function withDrawFunds(uint amount)public returns (bool success){
//         balances[msg.sender]-=amount;
//         balances[receiver]+=amount;
//         msg.sender.transfer(amount);
//         return true;
//     }
// }



