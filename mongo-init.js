db = db.getSiblingDB('database');
db.createCollection('collection');

// Add initial data to the collection
db.collection.insertMany([
  { name: "Alice", age: 30, city: "New York" },
  { name: "Bob", age: 25, city: "San Francisco" },
  { name: "Charlie", age: 35, city: "Los Angeles" }
]);
