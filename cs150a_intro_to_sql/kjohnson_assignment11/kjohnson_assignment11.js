// 1: Set the database object and connect 
db = connect("localhost:27017/library"); 

// 2: Create a new document in the user collection 
db.users.insert({fname: "Rachel", 
                lname: "Cunningham", 
                display: "Rachel Cunningham", 
                type: "student", 
                age: 24, 
                checkouts: []
            })

// 3: Query to retrieve the _id, display name and age of students who have checked out a book in cloud subject 
db.users.find({"checkouts.subject": "cloud"}, {display:1, age:1, }); 

// 4: First name, last name, type of faculty who have checked out one book on programming 
db.users.find({"checkouts.subject": "programming", type:"faculty"}, {fname: 1, lname:1, type:1}); 

// 5: Documents of users who are part of faculty and checked out book 5235 
// or students under 30 who have checked out book 5240
db.users.find(
    { 
        $or: [
        {
            $and: [
                {type: "faculty"},
                {"checkouts.book": "5235"}
            ]
        },
        {
            $and: [
                {type:"student"},
                {age: {$lt: 30}}, 
                {"checkouts.book": "5240"}
            ]
        }
    ]            
}, {display: 1, type: 1, }
);  
    

// 6: First name, last name, age of students between 22 and 26
db.users.find({age: {$gt:22, $lt:26 }}, {fname:1, lname:1,age:1}); 