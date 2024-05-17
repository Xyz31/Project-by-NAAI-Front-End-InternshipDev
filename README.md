# NAAI Project for Front-End Internship

A new Flutter iOS/Android/Web project.

## Demo Videos

Demo videos are available in the folder directory. Check them out for a better understanding of the application's functionality.

## Functionalities for This Application

### 1. Search Functionality:
- Implement a search bar where users can input the name of the anime they want to search for.
- Upon entering a query, the application should fetch data from the Jikan API using the provided endpoint (https://api.jikan.moe/v4/anime?q=<name_here>).
- Display search results in a scrollable list, showing the anime name, title, URL, and trailer thumbnail (if available).

### 2. Result Representation:
- Each search result should display the following information:
  - Anime name
  - Title
  - URL
  - Trailer thumbnail
- The user interface should be visually appealing and intuitive for users to navigate.

### 3. Integration with YouTube:
- When a user clicks on a search result, the application should redirect them to the YouTube app or website to watch the trailer.
- Ensure smooth transition and handling of any errors or exceptions during redirection.

## Dependencies

The project uses the following dependencies to meet the requirements:

### Flutter SDK

- **flutter**: The core framework used to build the app for iOS, Android, and Web platforms.

### HTTP

- **http: ^0.13.3**: 
  - **Purpose**: To fetch data from the Jikan API when a user searches for an anime.
  - **Context**: Used to make HTTP requests to the endpoint `https://api.jikan.moe/v4/anime?q=<name_here>` to retrieve anime data based on the user's search query.

### Shimmer

- **shimmer: ^2.0.0**: 
  - **Purpose**: To provide a loading animation while data is being fetched.
  - **Context**: Used to display a shimmering effect on placeholders in the UI until the actual data (anime search results) is loaded and ready to be displayed. This improves user experience by indicating that content is loading.

### URL Launcher

- **url_launcher: ^6.0.9**: 
  - **Purpose**: To handle URL launching within the app.
  - **Context**: When a user clicks on a search result, this package is used to redirect them to the YouTube app or website to watch the trailer. It ensures that external links (like YouTube URLs) are opened correctly, providing a seamless transition to the user.

### GetX

- **get: ^4.6.5**: 
  - **Purpose**: To manage state, dependencies, and route navigation.
  - **Context**: 
    - **State Management**: Helps in managing the state of the application, especially when dealing with the loading state and the display of search results.
    - **Dependency Injection**: Simplifies the process of injecting and accessing dependencies throughout the app.
    - **Route Navigation**: Facilitates smooth and animated transitions between different screens, such as navigating from the search results to the anime details view.


