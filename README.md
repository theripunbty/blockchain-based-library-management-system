
![image](https://github.com/user-attachments/assets/7c5d274a-cfe1-45b0-a7e1-f88172e62679)


# Blockchain-Based Library Management System

## Vision

The Blockchain-Based Library Management System aims to revolutionize the traditional library management system by leveraging blockchain technology. It provides a decentralized, transparent, and tamper-proof solution for managing book inventories. Users can interact with the system to add, issue, and return books, ensuring efficient management and real-time updates on the status of each book.

## Flowchart
```
 +------------------+
 |   User Interface |
 +--------+---------+
          |
          v
 +--------+---------+
 |  Connect Wallet  |
 +--------+---------+
          |
          v
 +--------+---------+
 |  Interact with   |
 | Smart Contract   |
 +--------+---------+
          |
  +-------+--------+
  |                |
  v                v
+---------+    +----------+
| Add Book|    |Issue/Return|
+---------+    |   Book     |
               +----------+
```

1. **Connect Wallet:** Users connect their Ethereum wallet to the application.
2. **Interact with Smart Contract:** The system communicates with the deployed smart contract.
3. **Add Book:** Users can add new books to the system.
4. **Issue/Return Book:** Users can issue or return books, with status updates recorded on the blockchain.

## Smart Contract

The smart contract manages the library's book inventory with the following functionalities:
- **Add Book:** Add a new book with a unique ID and title.
- **Issue Book:** Mark a book as issued.
- **Return Book:** Mark a book as returned.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Library {
    struct Book {
        uint id;
        string title;
        bool isIssued;
    }

    mapping(uint => Book) public books;
    uint public bookCount;

    event BookAdded(uint bookId, string title);
    event BookIssued(uint bookId);
    event BookReturned(uint bookId);

    function addBook(string memory _title) public {
        books[++bookCount] = Book(bookCount, _title, false);
        emit BookAdded(bookCount, _title);
    }

    function issueBook(uint _bookId) public {
        require(!books[_bookId].isIssued, "Book already issued");
        books[_bookId].isIssued = true;
        emit BookIssued(_bookId);
    }

    function returnBook(uint _bookId) public {
        require(books[_bookId].isIssued, "Book not issued");
        books[_bookId].isIssued = false;
        emit BookReturned(_bookId);
    }
}
```

## Contract Address

- **Ethereum Contract Address:** 0x9f37a05fd08b347c351289f81881bc2dfb82ce47


![image](https://github.com/user-attachments/assets/15dd8d99-5853-46ba-8060-981f506b910c)



## Future Scope

1. **Enhanced User Authentication:** Integrate user authentication to manage access control for issuing and returning books.
2. **Admin Panel:** Develop an admin panel for better book and user management.
3. **Advanced Book Tracking:** Implement features to track book history, including who issued or returned the book and when.
4. **Mobile Integration:** Develop mobile applications to access and manage the library system on the go.

## Contact

For inquiries, contributions, or support, please contact:

- **Email:** ripunbasumatary10@gmail.com
- **LinkedIn:** https://www.linkedin.com/in/ripun-basumatary-a62292300/
- **GitHub:** https://github.com/theripunbty

---

Feel free to reach out if you have any questions or suggestions. Happy coding!
```
