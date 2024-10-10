# NguyenQuocViet-SHub


## For Task 1:
After Clone Git, you need to install all dependence via npm install

Start the server: Npm run dev
Then test the API on Postman or any tools

Method: 
**POST**: 
* Route: http://localhost:8080/v1/api/upload - For upload xlsx file
**GET**: 
* Route: http://localhost:8080/v1/api/upload/*file_nane* - For Get the result
* In the body part: 
{
    "startTime": *start_time*,
    "endTime": *end_time*
}

## For task 2:
The **ERD** as well as the **.sql** file  i already put in the source code
### ERD
![ERD]:(./ERD.png)

## For task 3:
Method: 
**GET**: 
* Route: http://localhost:8080/v1/api/dsa- Get the Data from requirement
**POST**: 
* Route: http://localhost:8080/v1/api/dsa - Submit the result 