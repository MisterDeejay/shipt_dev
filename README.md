# Shipt Order API

## Table of contents:

* [Description](./README.md#description)
  * [Tasks](./README.md#tasks)
  * [Constraints](./README.md#constraints)
* [Assumptions](./README.md#assumptions)
* [Constraints](./README.md#constraints)
* [Setup](./README.md#setup)
* [Running the app](./README.md#running-the-app)
* [Running the tests](./README.md#running-the-tests)
* [Development notes](./README.md#development-notes)

## Description

* The application is a basic API application, where a customer can have an order that is made up of products.

## Tasks

Instructions

Please send a zip archive containing your code and any relevant materials into coding@shipt.com. Include a readme file explaining your assumptions, providing any necessary assumptions, and stating what you would accomplish with more time.

The purpose of this test is to verify your abilities, so this is the time to show everything you know that is applicable and relevant.

Read through the exercise background, complete as much as you can.

Thank you for taking the time to complete this assessment - we look forward to reviewing your solutions!

Tasks

Please implement the following stories.

1. A product belongs to many categories. A category has many products. A product can be sold in decimal amounts (such as weights).

2. A customer can have many orders. An order is comprised of many products. An order has a status stating if the order is waiting for delivery, on its way, or delivered.

3. Write a SQL query to return the results as display below:

Example

customer_id customer_first_name category_id category_name number_purchased

1 John 1 Bouquets 15

4. Include the previous result as part of a function in the application. If you are using an ORM, please write the query in your ORM's DSL. Leave the original SQL in a separate file.

5. An API endpoint that accepts a date range and a day, week, or month and returns a breakdown of products sold by quantity per day/week/month.

6. Ability to export the results of #5 to CSV.

7. An API endpoint that returns the orders for a customer.

Additional questions

No coding necessary, explain the concept or sketch your thoughts.

## Assumptions

A couple of developer decisions were made to assist with functionality of the application. A intermediary model, Item, was created to represent the actually objects received after a customer's order is placed. This include an attribute for quantity.

Sql query of output for a customer's list of purchases totaled by category double adds products if they belong to multiple categories. The query could easily be adapted to only choose one query; however, that was the route I chose for the first pass.

## Constraints

Time constraints were the most limited resource during v1.0 development. In addition to also working simultaneously on another coding challenge, I also have complete 2 on-site interviews, 6 online technical screens and 20+ phone interviews in the same period of time. Finding solid chunks of focused time was definitely at a premium.

## Setup

1. Make sure you have Ruby 2.3.7 & Rails 5 installed in your machine. If you need help installing Ruby, take a look at the [official installation guide](https://www.ruby-lang.org/en/documentation/installation/).

2. Install the [bundler gem](http://bundler.io/) by running:

    ```gem install bundler```

3. Clone this repo:

    ```git clone git@github.com:MisterDeejay/shipt_dev.git```

4. Change to the app directory:

    ```cd shipt_dev```

5. Install dependencies:

    ```bundle install```

6. Return JSON hash of products by day/week/month at between a start and end date:

    ```/api/items?start_date=<start_date>&end_date=<end_date>&interval=<day|week|month>```

7. Export to above data to CSV filename of choice in ./ship_dev/lib/tasks/data/<filename>

    ```rake file_exporter:product_sales_by[<filename.csv>,<day|week|month>,<start_date>,<end_date>]```

8. Return a list of the customer's order totaled by category
    ```/api/customer/:customer_id/orders```

9. Return a list of the customer's order totaled by category and print to CSV filename in /shipt_dev/lib/tasks/data/<filename>
    ```rake file_exporter:category_sales_totals[<filename>]```

You should be good to go from here on out!

### Running the app:
```localhost:3000```

### Running the tests:
```bundle exec rspec spec/```

### Development notes:

* With more time, there is a lot of development to continue with. More test coverage is needed to cover the basic API functions and main rake tasks of the application. I would also expand on the error case handling around edge cases of the application like when incomplete or incorrect input is given. As is, the app can handle basic failures like when ActiveRecord is not found and query params are nil, but additional support need to be added.

* BigDecimal was used for all decimal values, to avoid float imprecision particularly with attributes like Product#price

* Delivery status is managed through the [aasm_state gem](https://github.com/aasm/aasm)

* We want to give customers the ability to create lists of products for a one-click ordering of bulk items. How would you design the tables, what are the pros and cons of your approach?

This functionality has been added through the addition of the polymorphic relationship to Items. Items are listable and are connected to both the Order table and List table through listable_id and listable_type on the Item table. Items with a listable_type of Order are connected to an object of the same name that's connected to the Customer who placed it. These are items that are en route or have been delivered to the user. Items with a listable type of List, only exist electronically as long as the Customer made list for bulk ordering is around

If Shipt knew the exact inventory of stores, and when facing a high traffic and limited supply of a particular item, how do you distribute the inventory among customers checking out?

* In order to even begin track inventory, each Product would need a SKU. In addition, it would be smart to proactively create orders when items are added to the cart. At this point, we could add another state to the Order, "in cart", adding and deleting items from the db as the customer adds them to and from his/her cart. Once the item has been added, it can be removed from inventory and blocked for a certain amount of time (~10 min or less) by updating the Item#added_to_cart. Meanwhile, a cron job will be running that's constantly checking for items that were added to cart longer than 10 minutes ago, and can at that point be flushed or removed from the customer's cart and added back to stock. An even more user-friendly way, might be to also have an alert at that point adding some urgency about the product running low with a timer to when it will no longer be available (i.e. removed from the cart). This way you enable your app to keep track of stock without accidentally selling the same stock to two separate users, but also ensuring that the entire stock is accessible to the motivated buyers.

* Consider using the Factory Design Pattern<sup>1</sup> to create objects through the API CRUD actions. This would remove that responsibility from the various controller that will be hit, and they will no longer have to worry about storing state like params, user options etc. This would leave factory classes with a single responsibility of object creation.

* Continue to work on decoupling the dependencies on the different analyzers used to return the queries to the various API endpoint. Create base classes that handle more general query capabilities that the more specific class can expand on.

* Create form where users can pick the date range and interval type for finding the total number of products purchased and download a CSV of the data

<sup>1</sup> [Design Patterns (Erich Gamma, Richard Helm, Ralph Johnson, John Vlissides)](https://en.wikipedia.org/wiki/Design_Patterns)
