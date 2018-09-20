# Salamander

User inputs UPCs, builds product catalog/inventory.


## Features

* [ ] User signs in via Google.
* [ ] User inputs UPC, views product information. (GET /products/:upc)
* [ ] User adds product. (POST /users/:id/products)
* [ ] User inputs UPC, views completed eBay sales.
* [ ] User inputs UPC, views Amazon products/prices.


## GTIN Search

[Search by GTIN/UPC](http://gepir.gs1.org/index.php/search-by-gtin)

Examples...

* Input: 025192632723 Serenity DVD UPC. Output:
  - GTIN: 00025192632723
  - GS1 Company Prefix: 0025192
  - Licensee Name: Universal Home Video
  - Licensee Address: 10 Universal City Plz Ste 600, Universal City, CA
* Input: 097360625547 Star Trek III: Search for Spock DVD UPC. Output:
  - GTIN: 00097360625547
  - GS1 Company Prefix: 0097360
  - Licensee Name: Paramount Home Video
  - Licensee Address: 5555 Melrose Ave, Los Angeles, CA
* Input: 075678260728 Stone Temple Pilots CD
  - GTIN: 00075678260728
  - GS1 Company Prefix: 0075678
  - Licensee Name: Warner Music Group Corp
  - Licensee Address: 75 Rockefeller Plz, New York, NY


## TODO

* [ ] Encrypt API keys?


## Resources

* https://console.developers.google.com/apis/dashboard?authuser=1
* https://developer.walmartlabs.com/apps/mykeys
