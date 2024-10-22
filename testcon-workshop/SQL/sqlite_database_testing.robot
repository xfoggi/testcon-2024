
*** Settings ***
Library    DatabaseLibrary
Library    OperatingSystem

*** Variables ***
${DB NAME}    test_database.db

*** Test Cases ***
# Example Test Case: Basic Database Operations
Create And Verify Data In Database
    Connect To Database    sqlite3    ${DB NAME}
    
    # Create table if it does not exist
    Execute SQL String    
    ...    CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, name TEXT, age INTEGER)

    # Insert test data
    Execute SQL String    INSERT INTO users (name, age) VALUES ('Alice', 22)
    Execute SQL String    INSERT INTO users (name, age) VALUES ('Bob', 28)

    # Query and verify data
    ${result}=    Query    SELECT name, age FROM users WHERE name = 'Bob'
    Log Many    ${result}
    Should Be Equal As Strings    ${result[0][0]}    Bob
    Should Be Equal As Numbers    ${result[0][1]}    28

    # Clean up
    Execute SQL String    DELETE FROM users WHERE name = 'Bob'

    Disconnect From Database


# Example Test Case: Advanced Queries
Database Advanced Queries
    Connect To Database    sqlite3    ${DB NAME}
    
    # Insert multiple records
    Execute SQL String    INSERT INTO users (name, age) VALUES ('Chris', 35), ('Diana', 32)

    # Retrieve all records where age is above 30
    ${results}=    Query    SELECT name, age FROM users WHERE age > 30
    Log Many    ${results}

    # Verify number of results
    Length Should Be    ${results}    2

    # Verify specific values
    Should Be Equal As Strings    ${results[0][0]}    Chris
    Should Be Equal As Numbers    ${results[0][1]}    35

    Should Be Equal As Strings    ${results[1][0]}    Diana
    Should Be Equal As Numbers    ${results[1][1]}    32

    # Clean up
    Execute SQL String    DELETE FROM users WHERE age > 30

    Disconnect From Database


# Example Test Case: Connection Handling
Test Database Connection And Disconnection
    Connect To Database    sqlite3    ${DB NAME}
    Log    Database connected successfully
    Disconnect From Database
    Log    Database disconnected successfully


Connect to Database and Run Queries
    Connect To Database    sqlite3    ${DB NAME}

    # Create a table
    Execute SQL String    CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, name TEXT, age INTEGER)

    # Insert some data
    Execute SQL String    INSERT INTO users (name, age) VALUES ('John Doe', 30)
    Execute SQL String    INSERT INTO users (name, age) VALUES ('Jane Doe', 25)

    # Query the data
    ${result}=    Query    SELECT name, age FROM users WHERE age > 25

    # Verify the result
    Should Be Equal As Strings    ${result[0][0]}    John Doe
    Should Be Equal As Numbers    ${result[0][1]}    30

    # Clean up
    Execute SQL String    DELETE FROM users WHERE age > 25

    Disconnect From Database
