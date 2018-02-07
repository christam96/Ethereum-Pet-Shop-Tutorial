pragma solidity ^0.4.15;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
  Adoption adoption = Adoption(DeployedAddresses.Adoption());

  // Testing the adopt() function
  function testUserCanAdoptPet() {
    uint returnId = adoption.adopt(8);
    uint expected = 8;
    Assert.equal(returnId, expected, "Adoption of pet ID 8 should be recorded.");
  }

  // Testing retrieval of a single pets owner
  function testGetAdopterAddressByPetId() {
    // Expected owner is this contract
    address expected = this;
    address adopter = adoption.adopters(8);
    Assert.equal(adopter, expected, "Owner of pet ID 8 should be recorded.");
  }

  // Testing retrieval of all pet ownders
  function testGetAdopterAddressByPetIdInArray() {
    // Expected owner is this contract
    address expected = this;

    //Store adopters in memory rather than contract's storage
    address[16] memory adopters = adoption.getAdopters();

    Assert.equal(adopters[8], expected, "Owner of pet ID 8 should be recorded.");
  }
  
}
