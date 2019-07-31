# README

Navigate to:

```
A forecast for the location param (json):
https://pacific-caverns-58565.herokuapp.com/api/v1/forecast?location=denver,co
```

```
A photo relevant to the location param (json):
https://pacific-caverns-58565.herokuapp.com/api/v1/backgrounds?location=denver,co
```

```
A forecast for a destination at the arrival time:
params = {
  origin: "Denver,CO",
  destination: "Pueblo,CO",
  api_key: "jgn983hy48thw9begh98h4539h4"
}

post '/api/v1/road_trip', params: params
```

```
Three restaurants open at a given destination's arrival time
https://pacific-caverns-58565.herokuapp.com/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese
```
