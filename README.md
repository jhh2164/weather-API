# weather-API
Program with some SQL queries that outputs selected fields from the www.openweathermap.org API


## weather.py
Main program for running API request by inputting the city and optional country code (for accuracy). API key is hardcoded but can be adjusted by editing the ```api_token``` field in this script.

Please run program using:

```bash
python weather.py
```

#### How do you determine programmatically that this call was successful?
The script used to run the API calls should cover all the possible HTTP status codes, whether it's an error in the end point URL or an internal server error. 

#### How would you troubleshoot unsuccessful calls?
Based on the error message returned, the end user would be able to troubleshoot the unsuccesful call. In addition to the common status codes, it should also include quality, meaningful human readable messages, possibly a link to the API documentation, and point to where in the end-point URL there are errors. If it's a server error (500), it's also an added benefit to suggest common troubleshooting methods (restart browser, clear cache and delete cookies, .htaccess file). These would improve and increase efficiency on the client-side troubleshooting. 

## weather.sql
Some SQL statements to create table with test data and queries for selected information.
