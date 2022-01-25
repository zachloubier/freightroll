# README

## Getting started

```
$ bundle install
$ rails db:migrate
$ rails db:seed
$ rails server
```

## Viewing Different Screens

Once the rails server is running, you can navigate to localhost:3000 to view the initial screen to request an SMS code.
The form will submit data to the API via an AJAX call, but I was not able to get the view to change and move on to the next screen.

The following screen to verify the SMS code is located at localhost:3000/verify. Again the form will submit the data via an AJAX call, but will not update the view and move to the next screen.

The final screen to submit a job is located at localhost:3000/job. Same thing here as with the previous screens.

## API Routes

### Request SMS Code

Url: `POST /api/auth/requestsms`

```
payload: {
	"phone": string // The phone number of the driver (required)
}
```

##### Successful Response
```
response: {
	"sms_code": string // SMS Code that should be sent to their phone
}
```

##### Failed Response
```
response: {
	errors: string[] // Array of error messages encounted
}
```

### Verify SMS Code

Url: `POST /api/auth/verifysms`

```
payload: {
	"phone": string, // The phone number of the driver (required)
	"sms_code": string // The SMS code received by the driver (required)
}
```

##### Successful Response
```
response: {
	"id": int, // ID of driver
	"name": string, // Driver name (optional)
	"phone": string, // Driver phone number
	"sms_code": null,
	"created_at": string, // Created at timestamp
	"updated_at": string // Updated at timestamp
}
```

##### Failed Response
```
response: {
	errors: string[] // Array of error messages encounted
}
```

### Submit Job

Url: `POST /api/job`

```
payload: {
	"driver_id": int, // ID of driver (required)
	"company_name": string, // Company name (required)
	"name": string, // Name (required)
	"reference_number": string // Reference number (required)
}
```

##### Successful Response
```
response: {
    "id": int, // ID of job created
    "reference_number": string, // Reference number submitted
    "company_name": string, // Company name
    "driver_id": int, // ID of the driver who submitted the job
    "created_at": string,
    "updated_at": string,
    "name": string // Name field submitted
}
```

##### Failed Response
```
response: {
	errors: string[] // Array of error messages encounted
}
```


## Test Plan for Screen 3

This screen will accept the input from the driver, enter the information in the database in the jobs table. The job will be related to the driver through a db association and foreign key driver_id