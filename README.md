# kdb+ Bitcoin RPC

kdb+ script to interact with a running Bitcoin node via the json RPC API.

Configure connection details in api.q
url: location of the target node, default is http://127.0.0.1:8332
rpcuser: rpc user name, specify in bitcoin.conf on the node server
rpcpassword: rpc password, specify in bitcoin.conf on the node server

By default, the node binds to 127.0.0.1:8332. If you intend to query the node from another machine, you must configure rpcbind and rpcallowip in bitcoin.conf accordingly.

## Usage

Full reference at https://developer.bitcoin.org/reference/rpc

```
q)5#help[] 		// return all available commands and their arguments
"== Blockchain =="
"getbestblockhash"
"getblock \"blockhash\" ( verbosity )"
"getblockchaininfo"
"getblockcount"
```
```
q)help`getblockcount	// return description of the given method
"getblockcount"
""
"Returns the height of the most-work fully-validated chain."
"The genesis block has height 0."
""
"Result:"
"n    (numeric) The current block count"
""
"Examples:"
"> bitcoin-cli getblockcount "
"> curl --user myusername --data-binary '{\"jsonrpc\": \"1.0\", \"id\": \"curltest\", \"method\": \"getblockcount\..
""
```

For methods with optional arguments, call the method with an ordered list
```
q)// query for genesis block
q)getblock "000000000019d6689c085ae165831e934ff763ae46a2a6c172b3f1b60a8ce26f"
hash         | "000000000019d6689c085ae165831e934ff763ae46a2a6c172b3f1b60a8ce26f"
confirmations| 837053f
height       | 0f
version      | 1f
versionHex   | "00000001"
merkleroot   | "4a5e1e4baab89f3a32518a88c31bc87f618f76673e2cc77ab2127b7afdeda33b"
time         | 1.231007e+09
mediantime   | 1.231007e+09
nonce        | 2.083237e+09
bits         | "1d00ffff"
difficulty   | 1f
chainwork    | "0000000000000000000000000000000000000000000000000000000100010001"
nTx          | 1f
nextblockhash| "00000000839a8e6886ab5951d76f411475428afc90947ee320161bbf18eb6048"
strippedsize | 285f
size         | 285f
weight       | 1140f
tx           | ,"4a5e1e4baab89f3a32518a88c31bc87f618f76673e2cc77ab2127b7afdeda33b"
```
```
q)// query for genesis block, verbosity 0
q)getblock ("000000000019d6689c085ae165831e934ff763ae46a2a6c172b3f1b60a8ce26f";0)
"0100000000000000000000000000000000000000000000000000000000000000000000003ba3edfd7a7b12b27ac72c3e67768f617fc..
```
