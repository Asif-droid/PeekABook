# PeekAbook

# Project Overview
PeekAbook is a online book buy site where one can find various bookshops and can buy books from those shops designed using Oracle database and nodejs framework. This website was built as our Database course project.

# Programming Language 

* **`html`** 
* **`css`** 
* **`javascript`**
* **`pl/sql`**

# Framework
* **`nodejs`**

# Database
* **`Oracle 19c`**

# Features

## `Customer page`

- Home page
  - All the bookshops are available here .
  - User can search books by name in the search bar or can search books by genre available in the side bar
  - User can select a book and add to cart to buy this book later 

- Profile
  - User can see his profile and existing offers(will implement later)

- Carts
  - User can add quantity and address details and transaction id to buy books
  - Can also remove a book from the cart

##  `Shop_owner page`
- Home
  - Can see the details of his shop
- Books
  - Can see existing books and quantity of his books
- Add books
  - Can add books in his shop
- Orders
  - Can see existing orders and can remove them after delivery
- Total Earning
  - Can see the total amount of money the shop earned through different orders
## `Admin Dashboard`
- All shops 
    - Can see all existing shops
- Approve 
    - Can approve new shop
    - Only after admin approval shop owner can login and add books
- Add Author 
    - Can add new authors
- Add Publisher
    - Can add new publisher
- Show Author
    - Can see all existing authors
- Show Publisher
    - Can see all existing publishers

### Database Connection
In this project the database used is oracle.
- Holds all the data to function the project correctly. 

### Download

Download zip of this repository, or clone this from git cli

### Dependencies

The project runs on NodeJS environment. So at first you should download node in your machine.

## Installing

After cloning create a database user with the following permission
- create session.
- create sequence.
- create trigger.
- create table.
- create procedure
- unlimited tablespace.

Or, Run the following code in cmd after connecting as sysdba.

```
define username = <USERNAME>
define password = <PASSWORD>
create user &username identified by &password;
grant create session, create view,
 create sequence,
 create procedure,
 create table,
 create trigger,
 create type,
 create materialized view
 to &username;
```
- Go to sql_dumps folder and run all sql files to create the database
- Enable procedures and triggers provided in the Procedures and Triggres folder


**Install all dependencies**

  1.Provide username and pass of the user under which those tables and procedures are created, in the function.js file located in the node_project folder 
  
        try{
            connection = await oracle.getConnection({
                user:'c##asifur', // username of db user
                password:'123',     //pass of db user
                connectString : 'localhost/orcl'
                //"(DESCRIPTION =(ADDRESS = (PROTOCOL = TCP)(HOST = localhost)(PORT = 1521))(CONNECT_DATA =(SID= ORCL)))"
            });
            let result=await connection.execute(query,params);
            // console.log(result.rows,"row");weniweubngwunewgoin
            return result.rows;   
        }catch(error){
            console.log(error);

        }

   

  2. Install [npm](https://www.npmjs.com/) & [node](https://nodejs.org/en/download/)
     
    npm install
  
  3. Go to the package.json and install all dependencing by npm i dependency_filename
## Deployment

To deploy this project navigate to the node_project folder and run in cmd 

```bash
  node index.js
```
- The server listens at 8080 port
- Go to  http://localhost:8080/peekabook to view

    
 

# Project Team

* [K.M, Asifur Rahman](https://github.com/Asif-droid) : `1805063`
* [Sanju Basak](https://github.com/Sanju-Basak) : `1805064`

# Project Supervisor

- [Dr. Abu Sayed Md. Latiful Hoque](https://cse.buet.ac.bd/faculty_list/detail/asmlatifulhoque)
