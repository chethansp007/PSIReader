# PSIReader

 PSIReader app shows the PSI level and other reading of different parts of Singapore.
   
 The app shows the different visual way of representation of the annotations in the Map view based on the PSI index.
   
 App reads the data from https://data.gov.sg/dataset/psi .
   
 A user can also see other indexes based on region, upon selecting different annotation.


## Code Structure

PSIReader workspace comprises of 3 module.

1. App module - Display the user element, manage the user interaction and navigations.

2. Domain - This module act between App and Data module. This module has all the business logic that app has.(PSI Range)

3. Data - This module will take care of server interaction and persisting of data.

Each module should have there own unit tests. And the app will run all the unit test when building and distributing through CI.



