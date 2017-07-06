console.log('Loading Amazon Storefront...');

var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
  host: "localhost",
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: "Brevoun@17",
  database: "bamazon"
});

var askQuestions = function() {
    inquirer.prompt([
      {
        name: "id",
        message: "What is the id of the product you would like to purchase?"
      }, {
        name: "units",
        message: "How many units would you like to purchase?"
      }
    ]).then(function(answers) {
      checkAvailability(answers.id, answers.units);
    });
};

connection.connect(function(err) {
  if (err) throw err;
});

console.log("Here are all of the products to choose from:");

connection.query("SELECT * FROM products", function(err, res) {
  if (err) throw err;
  for(var product in res) {
  	printRow(res[product]);
  }
 
  askQuestions();
});


function checkAvailability(id, units) {
	var requestedUnits = parseFloat(units);
	connection.query("SELECT * FROM products WHERE item_id=?", [id], function(err, res) {
  		if (err) throw err;
  		printRow(res[0]);
  		var unitsAvailable = parseInt(res[0].stock_quantity);
  		if(requestedUnits > unitsAvailable) {
  			console.log("Insufficient quantity!"+ "\n");
  			process.exit();
  		} else {
  			console.log("Total cost: $" + (parseFloat(res[0].price) * requestedUnits).toFixed(2) + "\n");

  			connection.query("UPDATE products SET ? WHERE ?", [{stock_quantity: (unitsAvailable - requestedUnits)}, {item_id: id}], function(err, res) {
  				if (err) throw err;
			});

			connection.query("SELECT * FROM products WHERE item_id=?", [id], function(err, res) {
  				if (err) throw err;
  				printRow(res[0]);
  				process.exit();
  			});
  		}
	});
};

function printRow(obj) {
	console.log('item_id: ' + obj.item_id + ', product_name: ' + obj.product_name
	 + ', department_name: ' + obj.department_name + ', price: $' + obj.price
	 + ', stock_quantity: ' + obj.stock_quantity + '\n');
}