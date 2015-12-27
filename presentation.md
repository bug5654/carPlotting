Interactive Car MPG Plotting
========================================================
author: Nathan E. Wendling
date: 20151227

Motivation:
========================================================

- Consumers are currently very concerned with MPG on their cars
- Consumers also have other, sometimes more important values when purchasing a car (ie torque minimums requiring > 4 cylinders)


Internals
========================================================

- App uses checkboxes for all inputs, making debugging, testing,  and penetration testing much easier than inputs that allow injection.
- Rather than requiring a team, app was built in a few hours with a team of 1 person


Data Source
========================================================

The data used was gathered from the mtcars dataframe in the R internal `library(datasets)`


- MPG range from the data was (in miles/gallon) 

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  10.40   15.42   19.20   20.09   22.80   33.90 
```
- Weight range from the data was (in thousands of pounds)

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  1.513   2.581   3.325   3.217   3.610   5.424 
```


Utility
========================================================

The app allows users to graph only the cylinder levels they care about, seperate them and plot a running average line that shows what they can expect for a car's MPG at different weights and cylinders (I4, V6, V8), and only show the cylinder combinations that are relevant to their needs.
