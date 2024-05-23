import 'package:my_stock_analsys/models/company.dart';
import 'package:flutter/material.dart';

List<Company> companies1 = List<Company>.empty(growable: true);
Company google = Company(
  name: 'Google LLC',
  simbol: 'GOOGL',
  location: 'Mountain View, California',
  imgURL:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/800px-Google_%22G%22_Logo.svg.png',
  country: 'United States',
  industry: 'Technology',
  url: 'https://www.google.com',
  color: Colors.blue,
  value: false,
);

Company facebook = Company(
  name: 'Facebook Inc.',
  simbol: 'FB',
  location: 'Menlo Park, California',
  imgURL:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Facebook_f_logo_%282019%29.svg/800px-Facebook_f_logo_%282019%29.svg.png',
  country: 'United States',
  industry: 'Technology',
  url: 'https://www.facebook.com',
  color: Colors.red,
  value: false,
);

Company microsoft = Company(
    name: 'Microsoft Corporation',
    simbol: 'MSFT',
    location: 'Redmond, Washington',
    imgURL:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Microsoft_logo.svg/800px-Microsoft_logo.svg.png',
    country: 'United States',
    industry: 'Technology',
    url: 'https://www.microsoft.com',
    color: Colors.green,
    value: false);

Company apple = Company(
    name: 'Apple Inc.',
    simbol: 'AAPL',
    location: 'Cupertino, California',
    imgURL:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/1200px-Apple_logo_black.svg.png',
    country: 'United States',
    industry: 'Technology',
    url: 'https://www.apple.com',
    color: Colors.grey,
    value: false);

Company tesla = Company(
    name: 'Tesla Inc.',
    simbol: 'TSLA',
    location: 'Palo Alto, California',
    imgURL:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Tesla_logo_red.svg/800px-Tesla_logo_red.svg.png',
    country: 'United States',
    industry: 'Automotive',
    url: 'https://www.tesla.com',
    color: Colors.amber,
    value: false);

Company amazon = Company(
    name: 'Amazon.com Inc.',
    simbol: 'AMZN',
    location: 'Seattle, Washington',
    imgURL:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Amazon_logo.svg/800px-Amazon_logo.svg.png',
    country: 'United States',
    industry: 'Technology',
    url: 'https://www.amazon.com',
    color: Colors.orange,
    value: false);

Company nvidia = Company(
  name: 'NVIDIA Corporation',
  simbol: 'NVDA',
  location: 'Santa Clara, California',
  imgURL:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Nvidia_Corporation_logo.svg/800px-Nvidia_Corporation_logo.svg.png',
  country: 'United States',
  industry: 'Technology',
  url: 'https://www.nvidia.com',
  color: Colors.teal,
  value: false,
);

Company intel = Company(
  name: 'Intel Corporation',
  simbol: 'INTC',
  location: 'Santa Clara, California',
  imgURL:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Intel_logo_%282006-2020%29.svg/800px-Intel_logo_%282006-2020%29.svg.png',
  country: 'United States',
  industry: 'Technology',
  url: 'https://www.intel.com',
  color: Colors.purple,
  value: false,
);

Company netflix = Company(
    name: 'Netflix Inc.',
    simbol: 'NFLX',
    location: 'Los Gatos, California',
    imgURL:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Netflix_2015_logo.svg/800px-Netflix_2015_logo.svg.png',
    country: 'United States',
    industry: 'Technology',
    url: 'https://www.netflix.com',
    color: Colors.pink,
    value: false);

Company twitter = Company(
    name: 'Twitter Inc.',
    simbol: 'TWTR',
    location: 'San Francisco, California',
    imgURL:
        'https://upload.wikimedia.org/wikipedia/en/thumb/9/9f/Twitter_bird_logo_2012.svg/800px-Twitter_bird_logo_2012.svg.png',
    country: 'United States',
    industry: 'Technology',
    url: 'https://www.twitter.com',
    color: Colors.yellow,
    value: false);

Company disney = Company(
    name: 'The Walt Disney Company',
    simbol: 'DIS',
    location: 'Burbank, California',
    imgURL:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Disney%27s_logo.svg/800px-Disney%27s_logo.svg.png',
    country: 'United States',
    industry: 'Entertainment',
    url: 'https://www.disney.com',
    color: Colors.blueGrey,
    value: false);

Company salesforce = Company(
    name: 'Salesforce.com Inc.',
    simbol: 'CRM',
    location: 'San Francisco, California',
    imgURL:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Salesforce_logo.svg/800px-Salesforce_logo.svg.png',
    country: 'United States',
    industry: 'Technology',
    url: 'https://www.salesforce.com',
    color: Colors.lightGreen,
    value: false);

Company ibm = Company(
    name: 'International Business Machines Corporation',
    simbol: 'IBM',
    location: 'Armonk, New York',
    imgURL:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/IBM_logo.svg/800px-IBM_logo.svg.png',
    country: 'United States',
    industry: 'Technology',
    url: 'https://www.ibm.com',
    color: Colors.indigo,
    value: false);

Company cisco = Company(
    name: 'Cisco Systems Inc.',
    simbol: 'CSCO',
    location: 'San Jose, California',
    imgURL:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Cisco_logo.svg/800px-Cisco_logo.svg.png',
    country: 'United States',
    industry: 'Technology',
    url: 'https://www.cisco.com',
    color: Colors.deepOrange,
    value: false);

Company oracle = Company(
    name: 'Oracle Corporation',
    simbol: 'ORCL',
    location: 'Redwood City, California',
    imgURL:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Oracle_logo.svg/800px-Oracle_logo.svg.png',
    country: 'United States',
    industry: 'Technology',
    url: 'https://www.oracle.com',
    color: Colors.deepPurple,
    value: false);

Company hp = Company(
    name: 'HP Inc.',
    simbol: 'HPQ',
    location: 'Palo Alto, California',
    imgURL:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/HP_logo_2012.svg/800px-HP_logo_2012.svg.png',
    country: 'United States',
    industry: 'Technology',
    url: 'https://www.hp.com',
    color: Colors.lime,
    value: false);

Company dell = Company(
    name: 'Dell Technologies Inc.',
    simbol: 'DELL',
    location: 'Round Rock, Texas',
    imgURL:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Dell_logo.svg/800px-Dell_logo.svg.png',
    country: 'United States',
    industry: 'Technology',
    url: 'https://www.dell.com',
    color: Colors.cyan,
    value: false);

Company spacex = Company(
    name: 'Space Exploration Technologies Corp.',
    simbol: 'SPCE',
    location: 'Hawthorne, California',
    imgURL:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/SpaceX-Logo.svg/800px-SpaceX-Logo.svg.png',
    country: 'United States',
    industry: 'Aerospace',
    url: 'https://www.spacex.com',
    color: Colors.amber,
    value: false);

Company boeing = Company(
    name: 'The Boeing Company',
    simbol: 'BA',
    location: 'Chicago, Illinois',
    imgURL:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Boeing_Logo.svg/800px-Boeing_Logo.svg.png',
    country: 'United States',
    industry: 'Aerospace',
    url: 'https://www.boeing.com',
    color: Colors.blue,
    value: false);

List<Company> companies = [
  google,
  facebook,
  microsoft,
  apple,
  tesla,
  amazon,
  nvidia,
  intel,
  netflix,
  twitter,
  disney,
  salesforce,
  ibm,
  cisco,
  oracle,
  hp,
  dell,
  spacex,
  boeing,
];

List<Company> myCompanies = [];

var items = [
  const DropdownMenuItem(
    value: "line",
    child: Text("Line Graph"),
  ),
  const DropdownMenuItem(
    value: "histogram",
    child: Text("Histogram Graph"),
  ),
  const DropdownMenuItem(
    value: "area",
    child: Text("Area Graph"),
  ),
  const DropdownMenuItem(
    value: "bar",
    child: Text("Bar Graph"),
  ),
];
