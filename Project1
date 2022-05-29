// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract LandRegistry  {

    //Buyer Details//
struct Buyer{ 
  string Name;  
  uint Age;
  string City;
  uint CNIC;
  string Email;
}
address Buyeraddress= 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;
mapping (address => Buyer) private BuyerMapping;
mapping(address=>bool) public BuyerIsVerified;
 
    //Adding Buyer//
function addBuyer (string memory _Name, uint _Age, string memory _City, uint _CNIC ,string memory _Email) public{
BuyerMapping[Buyeraddress]=  Buyer(_Name, _Age, _City, _CNIC, _Email );
}
    //Updating Buyer//
function updateBuyer(string memory _newName, uint _newAge, string memory _newCity, uint _newCNIC ,string memory _newEmail) public {
  BuyerMapping[Buyeraddress]=  Buyer(_newName, _newAge, _newCity, _newCNIC, _newEmail );      
    }

    //Seller Details//
struct Seller{ 
  string Name;
  uint Age;
  string City;
  uint CNIC;
  string Email;
}
address Selleraddress=  0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
mapping (address => Seller) private SellerMapping;
mapping(address=>bool) public SellerIsVerified;

    //Adding Seller//
function addSeller (string memory _Name, uint _Age, string memory _City, uint _CNIC ,string memory _Email) public{
SellerMapping[Selleraddress]=  Seller(_Name, _Age, _City, _CNIC, _Email );
}
    //Updating Seller//
function updateSeller(string memory _newName, uint _newAge, string memory _newCity, uint _newCNIC ,string memory _newEmail) public {
  SellerMapping[Selleraddress]=  Seller(_newName, _newAge, _newCity, _newCNIC, _newEmail );      
  }

    //Land Details//
struct Landregistry{
  uint LandId;
  string Area;  //add square fee of area covered by land i.e 36 sq feet
  string City;
  string State;
  uint LandPrice;   //Add price in ether
  uint PropertyPID; 
  address payable Owneraddress; 
}
//Seller has to verified by the Land Inspectoe to sell/add Land
//Seller Account can not be Buyer Account
modifier sellerverified() {    
require(SellerIsVerified[Selleraddress]== true && Selleraddress != Buyeraddress , "You are not a verfied seller");
_; }

mapping (uint=> Landregistry) public lands;
mapping(uint=>bool) public LandIsVerified;

      //Only verified Seller can Add Land Details//
function SellerAddLand(uint _LandId, string memory _Area, string memory _City, string memory _State, uint _LandPrice, 
uint _PropertyPID, address payable _Owneraddress) sellerverified public  {
     lands[_LandId]= Landregistry(_LandId, _Area, _City, _State, _LandPrice, _PropertyPID, _Owneraddress);   
    LandIsVerified[_LandId]=true;  
}

    //Land Inspector Details//
address private landinspector;
constructor(){
    landinspector = msg.sender;}
modifier Onlyme() {    //the deployer of the contract will be the Land Inspector
  require(msg.sender== landinspector, "You are not the Land Inspector");
  _; }  

struct LandInspector{ 
  uint Id;
  string Name;
  uint Age;
  string Designation;
}
mapping (address=> LandInspector) private InspectorMapping;
function landInspector (uint _Id, string memory _Name, uint _Age, string memory _Designation ) Onlyme public{
InspectorMapping[msg.sender]= LandInspector(_Id, _Name, _Age, _Designation );
SellerIsVerified[Selleraddress]= true;
BuyerIsVerified[Buyeraddress]= true;
}

      // Inspector Validating Lands//
function validateLand (uint LandId) Onlyme private view returns(string memory){
  if(LandIsVerified[LandId] == true){
    return "Verified Land";
  }
  else{
    return "This land is not verified";
  }
}
      //Get Land Details//
function GetLandCity(uint _Landid) public view returns(string memory) {
 return lands[_Landid].City;
}
function GetLandPrice(uint _Landid) public view returns(uint) {
 return lands[_Landid].LandPrice ; //Land price will be in ethers
}
function GetArea(uint _Landid) public view returns(string memory) {
 return lands[_Landid].Area ;
}
function LandsOwner(uint _Landid) public view returns(address) { 
  return lands[_Landid].Owneraddress;
}

modifier BuyOnlyIf(){   //Buyer can only buy land if he is verified by the inspector
  require(BuyerIsVerified[Buyeraddress]== true, "You are not a verfied Buyer"); 
 _; }  

event FundsTransfer(address sender, uint _amount, uint _Landid, uint balance);
event Withdraw(address _to, uint _amount, uint balance);
event OwnerTransfer(address _to, string );

address payable owner;
address newOwner;
    /*Only Verified Buyer can buy land
      Buyer needs to have enough ether in his account to buy the land
      Land needs to be verified by Land Inspector
      If all checks are true, funds are transferred to current owner address
      Owner of the Land is changed to NewOwner
    */
function Buyland(uint _Landid) payable public BuyOnlyIf  {
  require(LandIsVerified[_Landid]== true, "Land is not verfied"); 
  require(Buyeraddress.balance>= lands[_Landid].LandPrice, "Not Enough Ether"); 
 emit FundsTransfer(Buyeraddress, lands[_Landid].LandPrice, _Landid, address(Buyeraddress).balance); 

 owner = lands[_Landid].Owneraddress;
 owner.transfer(lands[_Landid].LandPrice);
 emit Withdraw(lands[_Landid].Owneraddress ,lands[_Landid].LandPrice, address(owner).balance);
 
 bool sent= true;
require (sent, "Payment has not been made"); 
  newOwner=  Buyeraddress;
emit OwnerTransfer(Buyeraddress, "new owner");

}
  
    // Owner can transfer his land to any address he wants, without any payement//
    // Only Owner of a land can use this function//
function TransferOwnership(address _addr, uint _Landid) sellerverified view public {
  require(LandIsVerified[_Landid]== true, "Land is not verfied"); 
  _addr = lands[_Landid].Owneraddress;
}
}
