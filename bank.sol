<!DOCTYPE html>
<html>
	<head>
		<title>Bank</title>
		<style>
			label {
				display:block;
				padding:10px;
			}
			fieldset {
				width:400px;
				text-align:right;
			}
			font {
				font-family: "Times New Roman";
				
			}
			body {
			
				 background-color: normal;
				
			}
			
		</style>
		 <script src="web3.min.js"></script>
	</head>
	<body>
	         <font>
		<fieldset>	
			<label>Balance<input id="balance" type="text"/></label>
			<label><button  onclick="bal()" >balance</button></label>
		</fieldset>
		<fieldset>	
			<label>Transfer amount<input id="tamt" type="number"/></label>
			<label>Transfer account number<input id="taccno" type="text"/></label>
			<label><button  onclick="Transfer()" >Transfer</button></label>
		</fieldset>
		<fieldset>	
			<label>Mint amount<input id="mamt" type="number"/></label>
			<label><button  onclick="minn()" >Mint</button></label>
		</fieldset>
		<pre id="hashresult"></pre>
    Previous Hash : <pre id="prehashresult"></pre>
	</font>
		<script >
			web3.eth.defaultAccount = web3.eth.accounts[0];
			var aa=web3.eth.contract([
	{
		"constant": true,
		"inputs": [],
		"name": "name",
		"outputs": [
			{
				"name": "",
				"type": "string"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [],
		"name": "totalSupply",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"name": "owner",
				"type": "address"
			}
		],
		"name": "balanceOf",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "totalsupply",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "symbol",
		"outputs": [
			{
				"name": "",
				"type": "string"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"name": "amount",
				"type": "uint256"
			}
		],
		"name": "mint",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_to",
				"type": "address"
			},
			{
				"name": "_value",
				"type": "uint256"
			}
		],
		"name": "transfer",
		"outputs": [],
		"payable": true,
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"inputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"name": "owner",
				"type": "address"
			},
			{
				"indexed": false,
				"name": "to",
				"type": "address"
			},
			{
				"indexed": false,
				"name": "amt",
				"type": "uint256"
			}
		],
		"name": "Transfer",
		"type": "event"
	}
]);
		              
		var bb= aa.at('0x27a7d765fc53f29ab3ee9c7f911cdee6b90f0c49');
		var ba=document.getElementById('balance');
		var transferaccountno= document.getElementById('taccno');
		var transferamount= document.getElementById('tamt');
		var minamt= document.getElementById('mamt');
		 var output = document.getElementById('hashresult');
     		var preoutput = document.getElementById('prehashresult');
		if(web3.isConnected()) {
			console.log("web3 is connected");
		}
		else {
			console.log("web3 is not connected");
		}
		web3.version.getNetwork((err, netId) => {
            switch (netId) {
              case "1":
                console.log('This is mainnet')
                break
              case "2":
                console.log('This is the deprecated Morden test network.')
                break
              case "3":
                console.log('This is the ropsten test network.')
                break
              case "4":
                console.log('This is the Rinkeby test network.')
                break
              case "42":
                console.log('This is the Kovan test network.')
                break
              default:
                console.log('This is an unknown network.')
            }
        });
	 function totsupply(){
        
        	return bb.totalSupply(function(err,res){
                if (!err) {
                    output.innerText = res;
                }
                else{
                  output.innerText = "Error";
                }
              });
            }
	
        function Transfer(){
        
        	return bb.transfer(transferaccountno.value,transferamount.value,function(err,res){
                if (!err) {
                    output.innerText = res;
                }
                else{
                  output.innerText = "Error";
                }
              });
            }
	  function bal(){
        
        	return bb.balanceOf(ba.value,function(err,res){
                if (!err) {
                    output.innerText = res;
                }
                else{
                  output.innerText = "Error";
                }
              });
            }
	  function minn(){
        
        	return bb.mint(minamt.value,function(err,res){
                if (!err) {
                    output.innerText = res;
                }
                else{
                  output.innerText = "Error";
                }
              });
            }
	</script>
</body>
</html>
