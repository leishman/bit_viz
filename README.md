BitViz
=======

IN PROGRESS. APP CURRENTLY IN DEVELOPMENT

This app allows users to login with their [Coinbase](http://www.coinbase.com) account using three-legged OAuth 2.

The application requests permission to view the user's account balance, transfer history and transaction history. The app DOES NOT request permission to make any transactions on a user's account. Once a user signs in, their Coinbase history is downloaded or updated on our servers. I am aware that this is sensitive data and future versions of the app will store less or more anonymous data.

When a user signs in they see metrics about their Bitcoin history allowing them to have a better understanding of the return on their investment, transaction behaviors, etc.

Currently this application is in a very early MVP stage and is still being built out. The visualizations are being done using [d3.js](http://www.d3js.org).
