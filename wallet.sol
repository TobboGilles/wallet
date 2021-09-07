pragma solidity ^0.7.0 ;


// send and SendAndRecieveEther
// compredre la fonction fallback
// msg.value = la valuer que recoit le compte ether 
// msg.sender = l'address qui deploit le contract
// event = informer l'etat actuel du contract

contract SendAndRecieveEther {         
     
    address  admin; 
     uint public valeurRecu;
     
     event recevoir (uint value);
     event transfer (address expediteur, address beneficiare , uint valuer);
    
    receive () external payable{
        valeurRecu+=msg.value; 
        emit recevoir  (msg.value);
    }
    
    constructor () {
        admin=msg.sender;
    }
     
     modifier OnlyAdmin {
      require(msg.sender==admin , "Only admin can Withdrawmoney");
         _;
     }
     
    
     
    function checkCurrentBalance () view public returns (uint) {
        return address(this).balance; // to check the balance 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    }   
    
    function Withdrawmoney ( address payable _add) public OnlyAdmin {
        
        _add.transfer(address(this).balance);
        
        emit transfer (msg.sender, _add , address(this).balance);
    }
    
   
}
