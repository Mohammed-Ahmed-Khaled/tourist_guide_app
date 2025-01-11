# Tourist Guide App

A flutter mobile application for tourists visiting Egypt to explore landmarks, and other attractions across different Egyptian governorates.

## Features

- **Signup Page**: 
  - Input fields for Full Name, Email, Password, and Phone Number (optional).
  - A Signup button that navigates to the Login Page.

- **Login Page**: 
  - Input fields for Email and Password.
  - Validates credentials and navigates to the Welcome Page upon successful login.

- **Home Page**: 
  - Two sections: Suggested Places to Visit (grid view) and Popular Places (horizontally scrollable list view) using (tabBar Widget).
  - Each card includes an image, name of the place, name of its governorate, and a toggleable favorite icon.

- **Governments Page**: 
  - Displays a list of three Egyptian governorates.
  - Navigates to a page showing two landmarks specific to the selected governorate.

- **Profile Page**: 
  - Displays user details including Full Name, Email, and Password (hashed for security).

- **Favorites Page**: 
  - Displays static cards similar to the Popular Places section on the Home Page.

- **Bottom Navigation Bar**: 
  - Includes icons for Home, Governments, Favorites, and Profile, visible on all main pages.

- **Page Navigation Animations**: 
  - Implements animations during page transitions for a smoother user experience.
