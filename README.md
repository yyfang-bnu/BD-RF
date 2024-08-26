# BD-RF

Soil Bulk Density Using Random Forest

This repository contains R code for implementing the Random Forest algorithm, aimed at predicting the spatial distribution of soil bulk density at landscape scale based on altitude, vegetation, and soil factors. The Random Forest algorithm is a powerful ensemble learning method that combines multiple decision trees to make predictions.

Prerequisites To run the code in this repository, you need:
• R-studio (2023 or higher)

Data Preparation:
Place the Sampled_points.csv dataset file in the specified working directory. Ensure that the path is set correctly and that the file can be accessed by R.

Model Construction:
Run the BD-RF.R file in R to build the optimal training model using the Random Forest algorithm and measured data. This model will be used to predict the soil bulk density of the entire grid points.

Data Acquisition and Processing:
Download the following datasets from the internet:
DEM data (Digital Elevation Model)
Landuse data (Land Use)
FVC data (Fractional Vegetation Cover)
Process the data in ArcGIS:
Load the downloaded DEM, Landuse, and FVC data into ArcGIS.
Use tools within ArcGIS to extract these data to the grid points, ensuring that each grid point contains corresponding DEM, Landuse, and FVC values.

Bulk Density Prediction:
Using the optimal training model built in Step 2, predict the soil bulk density of the entire grid points in R by leveraging the extracted grid point data (including DEM, Landuse, FVC, and other input features). The model will predict the soil bulk density for each grid point, and the results will be output in an appropriate format for further analysis or visualization.

Contact For any inquiries or questions, please contact Yanying Fang at yyfang@mail.bnu.edu.cn.
