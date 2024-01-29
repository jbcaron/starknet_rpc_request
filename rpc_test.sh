l!/bin/bash

# Color and style codes
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
BOLD='\033[1m'
BG_BLUE='\033[44m'
BG_GREEN='\033[42m'
BG_RED='\033[41m'
NC='\033[0m'

server1="http://url/server1:port"
server2="http://url/server2:port"

get_transaction_receipt(){
    local server=$1
    local hash=$2
    curl -s -H "Content-Type: application/json" -d '{
        "jsonrpc": "2.0",
        "method": "starknet_getTransactionReceipt",
        "params": {
            "transaction_hash": "'$hash'"
        },
        "id": 0
    }' $server | jq
}

get_transaction_by_hash(){
	local server=$1
	local hash=$2
	curl -s -H "Content-Type: application/json" -d '{
        "jsonrpc": "2.0",
        "method": "starknet_getTransactionByHash",
        "params": {
            "transaction_hash": "'$hash'"
        },
        "id": 0
    }' $server | jq
}

get_transaction_by_block_id_and_index(){
    local server=$1
    local block_number=$2
    local index=$3
    curl -s -H "Content-Type: application/json" -d '{
        "jsonrpc": "2.0",
        "method": "starknet_getTransactionByBlockIdAndIndex",
        "params": {
            "block_id": {
                "block_number": '$block_number'
            },
            "index": '$index'
        },
        "id": 0
    }' $server | jq
}

while true; do
    echo "Menu: "
    echo "  1) get_transaction_receipt"
    echo "  2) get_transaction_by_hash"
    echo "  3) get_transaction_by_block_id_and_index"
    echo "  4) Exit"
    read -p "Enter choice: " choice

    case $choice in
        1)
            read -p "Enter transaction_hash: " hash
            echo -e "\n${BG_GREEN}Transaction receipt from ${BOLD} ${server1}:${NC}"
            get_transaction_receipt "$server1" "$hash"
            echo -e "\n${BG_GREEN}Transaction receipt from ${BOLD} ${server2}:${NC}"
            get_transaction_receipt "$server2" "$hash"
            ;;
        2)
            read -p "Enter transaction_hash: " hash
            echo -e "\n${BG_GREEN}Transaction from ${BOLD} $server1:${NC}"
            get_transaction_by_hash "$server1" "$hash"
            echo -e "\n${BG_GREEN}Transaction from ${BOLD} ${server1}:${NC}"
            get_transaction_by_hash "$server2" "$hash"
            ;;
        3)
            read -p "Enter block_number: " block_number
            read -p "Enter index: " index
            echo -e "\n${BG_GREEN}Transaction from ${BOLD} ${server1}:${NC}"
            get_transaction_by_block_id_and_index "$server1" "$block_number" "$index"
            echo -e "\n${BG_GREEN}Transaction from ${BOLD} ${server2}:${NC}"
            get_transaction_by_block_id_and_index "$server2" "$block_number" "$index"
            ;;
        4)
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid option $choice"
            ;;
    esac
done
