Brief

1. Develop a native mobile app which uses the Flickr API to display a list of photos.

This is a 100% Swift app built in Xcode. I've used SwiftUI to get the project up and running as quickly as possible. It also means I don't require any 3rd party libraries.

2. The app should display a list of photos, along with the poster's userid and user icon. The app should display alongside the photo a list of any tags associated with the photo. 

I've used an MVVM design pattern to demonstrate some unit testing in this module. There's a single column of pictures, with the user icon and user name, displayed beneath a search bar. You have to press the search button to initiate a search. The rest of the behaviour is default - the search bar disappearing on scroll, for example - as users would expect.

3. Tapping on the photo should take the user to a separate page wherein they can see more detail about the photo.

4. Tapping on a user id/photo should produce a list of photos by that user.
