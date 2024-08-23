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

