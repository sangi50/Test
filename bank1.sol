pragma solidity ^0.4.0;

contract bank {
  
   address owner;
   string public name;
   string public symbol;
   uint256 public totalsupply;
    mapping(address=>uint256)balances;
    mapping(address=>mapping(address=>uint256))allowed;
    modifier onlyowner() {
        require(owner==msg.sender);
        _;
    }
    modifier check (uint256 amount) {
      require(totalsupply>=amount);
      _;
  }
    event Transfer(address owner,address to,uint256 amt);
  
    function bank() {
        owner=msg.sender;
        name="MNW";
        symbol="M";
        totalsupply=10000;
        balances[msg.sender]=totalsupply;
    }
     function totalSupply() constant returns (uint256)
    {
        return totalsupply;
    }
  function transfer(address _to, uint256 _value) onlyowner payable{
    require(_to != address(0));
    require(_value <= balances[msg.sender]);
    require(totalsupply>_value);
    balances[msg.sender] = balances[msg.sender]-(_value);
    balances[_to] = balances[_to]+(_value);
    Transfer(msg.sender,_to,_value);
  }
   function mint(uint256 amount) public onlyowner check(amount) view returns(uint256) {
      balances[msg.sender]=balances[msg.sender]+(amount);
      return(balances[owner]);
      
  }
  function balanceOf(address owner) public view returns (uint256) {
    return balances[owner];
  }
  

}
