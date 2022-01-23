# Design-and-Implementation-of-a-DataBase-System

**Objectives:** The objectives of this project are the following:

1) To model user requirement specifications using E-R diagrams.
2) Reduce an E-R diagram to an appropriate set of relational schemas.
3) To create indexes in Oracle.


**Project Description:**
Suppose that you get a contract to build a database for Walmart. As you know, there are
many Walmart stores. Each store has a manager and an assistant manager, and several other
employees like cashiers and cleaning personnel. We know the name, address, phone(s),
and salary of each employee. Each employee is uniquely identified by his/her employee
ID. Each store keeps track of its inventory, so it knows how many items of each product
there are currently at the store. Each product has multiple associated providers; for each
provider, the store keeps track of its name and address. As you know, clients visit stores to
shop for products. There are two types of clients: regular and VIP clients. Walmart keeps
track of the client ID, name, address, phone of each client. For VIP clients, however, the
store also keeps track of the client’s birthdate. The store keeps track of each purchase made
by a client, by recording the date of purchase, the total amount paid for the visit, and the
list of all the products purchased by the client in each transaction. Each purchase is made
by a client and is associated with the cashier who processed the transaction.

Walmart wants to be able to perform the following queries:
1. Given the client ID of a client as an input parameter, find the names of the products
purchased by that client.
2. For each store, list the name of the customer that has spent the most money over
the last month.
