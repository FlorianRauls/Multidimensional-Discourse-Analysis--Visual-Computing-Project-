# abgabe_visual_computing
 
Presentation & report can both be found inside the entry node of the GitHub repository.

## How to build the software
The project consists of two main parts:
1. The main application which can be found [here](code/application/index.html)
2. The preprocessing pipeline which can be found [here](code/preprocess)

### Main application
The main application needs to be run through an webserver. We recomend using IDE plugins like [Live Server](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer) or npm packages like [http-server](https://www.npmjs.com/package/http-server). Just start the webserver in the same folder as the index.html and navigate a browser like Google Chrome or Firefox to the corresponding localhost adress.


### Preprocessing pipeline
Since this project has been under development for ~2 years there have been changes to the Twitter API since the start of it. This means that the origian data sourcing cannot be reproduced sadly. Data which has been run through the pipeline can be found [here](code/application/data/dummy/real.json).

## How to use the software
### Controls
Hover over cube: Shows information of the corresponding message
Left-Click: Navigate Camera
Right-Click: Navigate Camera
Scroll: Navigate Camera

Double Left-Click: Opens up conversational tree of corresponding message (can bug sometimes if clicked from large distance of object)

Middle mouse button: Close all opened conversational trees

### General usage
The software can be used to explore messages posted in the US in relation to the COVID-crisis. Users can explore different messages over time and space and open up conversational trees to see how sentiments, tone and contents of conversations change over time.
