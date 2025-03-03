/// comentario simple
/*comentario multiple*/

/*
variables:
uint entero
bool boleano
string cadena de texto
address addres
bytes datos binario

*/
/*
(a==3? verdadero:falso) operador ternario
uint data=[1,2,3,4,5] lista de entero


*/



// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 < 2.0.0;

contract Bienvenida{

    // function getResult() public view returns(uint){
    //     uint a=13;
    //     uint b=22;
    //     uint result=a+b;
    //     return result; 
    // }
    //funciones y for
    // uint [] listaLarga=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28];
    // uint [] ListaNumeros=[1,4,34,56];
    // function loopListaNumeros(uint numero) public view returns(bool){
    //     bool Num=false;
    //     for (uint i = 0; i < listaLarga.length ;i++ ){
    //         if(listaLarga[i] ==numero)  
    //         {Num = true;}else{
    //             Num=false;
    //         }
    //     }
    //     return Num;
    // }

    // function NumPares() public view returns (uint){
    //     uint par=0;
    //     for(uint i=0;i<listaLarga.length;i++){
    //         if(listaLarga[i]%2==0){
    //             par++;
    //         }
    //     }
    //     return par;
    // }

    //cadenas
    // string nombre="eric";
    // string apellido="alexander";

    // function hola() public view returns (string memory){
    //     return nombre;
    // }
    // function obtenerCaracteres() public view returns (uint){

    //     bytes memory stringToBytes=bytes(nombre);  //convierte una string en bites
    //     return  stringToBytes.length;
    // }

    //enum lista con valores pre definidos.
    //enum tamanoPapas {GRANDE,MEDIANO,PEQUENO}
    // tamanoPapas choice;
    // tamanoPapas constant defaultChoice= tamanoPapas.GRANDE; //VALOR POR DEFECTPO EN GRANDE

    // function setSmall() public{
    //     choice= tamanoPapas.PEQUENO; //lo cambio a pequeño
    // }
    // function getChoice() public view returns (tamanoPapas){
    //     return choice;
    // }
    // function defaultChoice() public  view returns (uint){
    //     return  uint(defaultChoice);
    // }

    //struct para representar un registro

    // struct Libro{
    //     string titulo;
    //     string tema;
    //     uint id_libro;
    //     string autor;
    // }

    // Libro libro;
    // function setBook() public{
    //     libro=Libro("hola","algo",1,"yo");
    // }
    // function getBookId() public view returns (uint){
    //     return libro.id_libro;
    // }

    ////mapping par clave/valor

    // mapping(address=>uint)public miMap;
    // function ggetAddres(address _addr)public view returns (uint){
    //     return miMap[_addr];
    // }
    // function setAddres(address _addr, uint _i)public{
    //     miMap[_addr]=_i;
    // }
    // function deleteAddres(address _addr) public{
    //     delete miMap[_addr];
    // }

    // mapping(uint=>Movie)movie;
    // mapping(address=>mapping (uint=>Movie))public  myMovie; ///mapeo adentro de otro mapeo
    // struct Movie{
    //     string title;
    //     string director;
    // }
    // function addMovie(uint id, string memory title, string memory director)public{
    //     movie[id]=Movie(title,director);
    // }

    // function addMyMovie(uint id, string memory title, string memory director)public{
    //     myMovie[msg.sender][id]=Movie(title,director); ////msg.sender tiene el address
    // }

    ////cuanto <bits mas barato
    // uint32 a=0x12345678;
    // uint16 b=uint16(a); ///0x1234  conversion elimina los valores mas altos
    
    // uint16 c=0xd432;
    // uint32 d=uint32(c);//0x0000xd432

    // bytes2 g=0x1234;
    // bytes4 h=bytes4(g); //0x12340000
    
    ///variables especiales
    // msg.sender //usuario que esta interactuandio con el contrato
    // view //ver la funcion y no modifica la funcion de ella/get
    // pure //retorna un calculo, no permite leer ni modificar el estado

    //fallback cuando un codigo falla
    // event Log(uint gas);
    // fallback() external  payable{
    //     emit Log(gasleft()); ///gasleft -cuanto gas nos queda
    // }
    // function getBalance() public view returns (uint){
    //     return address(this).balance;
    // }

    // function transferTofallback(address payable _to)public payable {
    //     ///enviar ether con metodo transfer
    //     _to.transfer(msg.value);
    // }

    // function callFallback(address payable _to)public payable {
    //     ///enviar ether al metodo fallback
    //     (bool sent,)=_to.call{value:msg.value}("");
    //     require(sent,'failed to send');
    // }
// }
// contract Oracle{
//     ////criptografia
//     address admin;
//     uint public rand;
//     constructor()public{
//         admin=msg.sender;
//     }
//     function feedRand(uint _rand)external {
//         require(msg.sender==admin);
//         rand=_rand;
//     }

// }
// contract GenerateRandNum{
//     Oracle oracle;
//     constructor(address oracleAddress){
//         oracle=Oracle(oracleAddress);
//     }
//     //crer numero aleatorio
//     function randNum(uint range)external view returns (uint){
//         return uint(keccak256(abi.encodePacked(oracle.rand(),block.timestamp,block.difficulty,msg.sender)))%range;
//     }

// }

////accesos
//onlyBy - solo la paewrsona mencionada puede llamar esta funcion
//onlyAfter -- llamada despues de cierto periodo de tiempo
//costs - llamada solo si se porporciona cierto valor
}
// contract restricciones{
//     address public owner=msg.sender;
//     uint public creationTime=block.timestamp;

//     modifier onlyBy(address _account){
//         require(msg.sender==_account,'sender not authorized');
//         _;
//     }
//     modifier onlyAfter(uint _time){
//         require(block.timestamp>= _time, 'not enough time passed');
//         _;        
//     }   
//     //creasruna funcion quercambie laaddres del dueño
//     function changeOwnerAddress(address _newAddress)onlyBy(owner) public {
//         owner=_newAddress;
//     }
//     //una funcion que elinime al dueño
//     function disown() onlyBy(owner) onlyAfter(creationTime + 5 weeks)public{
//         delete owner;
//     }
//     modifier cost(uint _amount){
//         require(msg.value>=_amount,'not enough ether');
//         _;
//     }
//     function forceChangedOwner(address _newOwner)payable public costs(100 ether)    {
//         owner=_newOwner
//     }
// }
///para vincular contratos al contrato principal se usa A a=new A()
//is - para heredar del contrato padre
// ///eventos
// contract eventos{
//     event NewTrade(
//         uint indexed date;
//         address from;
//         address indexed to;
//         uint indexed amount;
//     )

//     function trade(address _to,uint _amount)external{
//         //programas externos pueden leer esto
//         emit NewTrade(block.timestamp,to,amount);
//     }

// }

///abstract conmtract - contrato sin ninguna implementacion ideal para usarlo con herencia 
///interfaces = contratos abstractos, evita la redundancia
///estas no puede tener un constructor, variables de estado
// contract counter{
//     uint public count;
//     function increment() external{
//         count+=1;
//     }
// }
// interface Iconter{
//     function count() external view returns (uint);
//     function increment() external;
// }
// contract MiContrato{
//     function incrementCounter(address _counter)external{
//         Iconter(_counter).increment();
//     }    
//     function getCount(address _counter)external view returns (uint){
//         return Iconter(_counter).count();
//     }
// }

////librerias
// library Search{
//     function indexOf(uint[] storage self,uint value)public view returns (uint){
//         for(uint i=0;i<self.length;i++) if(self[i]==value) return i;
//     }
// }

////asembly para manipular la mv de etherum
// function sum() external{
//     uint x;
//     uint y;
//     assembly{
//         let z:= add(x,y)
//     }
// }

// function sum2() public view returns (bool success){
//     uint size;
//     address addr;
//     assembly{
//         size:=extcodesize(addr)
//     }
//     if(size<=0){return true;}else{return  false;}
// }

//manejo de errores
////asser,require,revert