
// This is marker
// for contract not
// to be deployed to 
// any environment
contract abstract {}

contract owned is abstract {
  address owner;
  function owned() {
    owner = msg.sender;
  }
  modifier onlyowner() {
    if (msg.sender==owner) _
  }
}

contract mortal is abstract, owned {
  function kill() onlyowner {
    if (msg.sender == owner) suicide(owner);
  }
}

contract NameReg is abstract {
  function register(bytes32 name) {}
  function unregister() {}
  function addressOf(bytes32 name) constant returns (address addr) {}
  function nameOf(address addr) constant returns (bytes32 name) {}
  function kill() {}
}

contract nameRegAware is abstract {
  function nameRegAddress() returns (address) {
    return 0x0860a8008298322a142c09b528207acb5ab7effc;
  }
}

contract named is abstract, nameRegAware {
  function named(bytes32 name) {
    NameReg(nameRegAddress()).register(name);
  }
}
