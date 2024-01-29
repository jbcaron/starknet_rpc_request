# Starknet RPC Tool

This script provides a simple, interactive command-line interface for querying and compare RPC calls from two predefined servers.

## Supported queries:
- get transaction receipts 
- get transactions by hash
- get transactions by block ID and index.

## Prerequisites

- `bash` shell
- `curl` command-line tool for making HTTP requests
- `jq` command-line JSON processor

## Usage

1. Clone this repository or download the script to your local machine.
2. Make the script executable: `chmod +x rpc_test.sh`.
3. Run the script: `./rpc_test.sh`.
4. Follow the on-screen menu to select the desired operation.

## Configuration

The script is preconfigured to query transactions from two servers. You can modify the server1 and server2 variables at the top of the script to point to your desired servers.

```bash
server1="http://url/server1:port"
server2="http://url/server2:port"
```

## Note

This script is intended for demonstration purposes. Ensure you have the necessary permissions to query the specified servers and that you use it in accordance with applicable policies and guidelines.
