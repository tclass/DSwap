pragma solidity ^0.4.19;

contract DSwapProduct {
    
    event Error(string);

    struct Product {
        string name;
        uint price;
        string description;
        address seller;
        bool paid;
        //string[15] attributes;
    }

    Product public product;
    
    // creates a product
    function create(string _name, uint _price, string _description) public {
        Product storage product;

        product.name = _name;
        product.price = _price;
        product.description = _description;
        product.seller = msg.sender;
    }

    // updates a product
    function update(string _name, uint _price, string _description) public {
        // only the seller can update the product
        if (product.seller != msg.sender) {
            log0(bytes32("only seller can change contract"));
            return;
        }
        product.name = _name;
        product.price = _price;
        product.description = _description;
    }


    // pays for a product
    function pay() payable public {
        // the seller can't buy his/her own product
        if (msg.sender == product.seller) {
            return;
        } 
        // if amount send is equal price, we set the product to paid = true
        if (msg.value == product.price) {
            product.paid = true;
            return;
        }
    }

}
