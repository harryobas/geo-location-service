# geo-location-service

## Requirement

1. Elixir 1.11.x
2. PostgreSQL 10.x

## Project Structure 

* Api (apps/geo_location_service_api) - Web API layer
* Core (apps/geo_location_service_app) - data layer

## How to run 

### Docker 
Make sure to have both docker and docker-compose installed on your machine and follow the instructions below:

1. $ git clone https://github.com/harryobas/geo-location-service.git
2. $ cd geo-location-service
3. $ sudo docker-compose build
4. $ sudo docker-compose up -d

## API Endpoint 

### Address: `localhost:4000`

### `POST /api/locations/search`
  - Request body:

  ```
  { "query": {"ip": string // ip address } }

  ```
   - Response

    - 200 Success

    ```
     {
        "data": {
            "city": string,
            "country": string,
            "country_code": string,
            "latitude": integer,
            "longitude": integer,
            "mystery_value": integer
        }
    }

    ```
    - 404 Not Found

    ```
    { "error": string, "details": string }

    ```




