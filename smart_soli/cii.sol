// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


interface Istorage {

    function getNum() external view returns (uint);
    function add() external ;

}

contract Contract2{
    constructor (){
   
    }


    function proxyadd()public {
        Istorage(0xd7Ca4e99F7C171B9ea2De80d3363c47009afaC5F).add();
        
    }

    function proxygetnum()public view returns (uint){
        uint value= Istorage(0xd7Ca4e99F7C171B9ea2De80d3363c47009afaC5F).getNum();
        return value;

    }
}










-------------------------------------------------------------------------------
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Storage{
   uint public  num;


   constructor(uint _num){
    num=_num;
   }



   function getNum()public view returns(uint){
    return  num;

   }


   function add() public {
    num=num+1;
   }
}