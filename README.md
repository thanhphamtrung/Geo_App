# geo_app
- Geo App provides tracking and updating user location and store it into `Amplify DataStore`.
- Using provided `data.json` file to plot the markers and polygons of the pickup location.
- Provide `ETA` and `Distance` by using `map box direction`.
- Show `Pickup Order` button if user location is inside `Pickup Location`


<img src="https://github.com/thanhphamtrung/Geo_App/blob/master/assets/login.png" width="250" height="450" /> <img src="https://github.com/thanhphamtrung/Geo_App/blob/master/assets/signup.png" width="250" height="450" /> <img src="https://github.com/thanhphamtrung/Geo_App/blob/master/assets/confirm.png" width="250" height="450" />

<img src="https://github.com/thanhphamtrung/Geo_App/blob/master/assets/profile.png" width="250" height="450" /><img src="https://github.com/thanhphamtrung/Geo_App/blob/master/assets/home.png" width="250" height="450" /><img src="https://github.com/thanhphamtrung/Geo_App/blob/master/assets/mapinfo.png" width="250" height="450" />

## App Flow:
### Sign in: 
- username: thanhpt22emu@gmail.com
- password: Thanh123!
- Using provided account to login or using `register` feature by tap on `Sign Up` on `Login Screen`.
## Sign Up:
- Enter email, password and full name. Then app will navigate to `Confirm Screen`. Using the `Confirm pass code` in your entered email. Then app will navigate to `Login Screen`.

## Checking location:
- Tap on `Save Current Location` will save the user current location. Then tap on `Draw Destination` will bring you to `Map` with `route` from `your location (currently using hard code value LatLng(-37.885371, 145.07845)) to `customer location`. This map also display `Pickup Location` that it's info provided in `data.json`.
- Tap on `Info Icon` at top right of the screen show ETA and distance.
- If `customer location` is inside `Pickup Location` you will see `Pickup Order` button, else you will not see it.
- Tap `back button` when you want to track another location. And draw a new map.
- Tap `Sign Out` Button if you want to Sign Out of the account.

