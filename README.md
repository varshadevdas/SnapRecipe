# SnapRecipe

SnapRecipe is a Flutter-based mobile application that simplifies recipe creation by leveraging real-time image processing and AI-powered recipe generation. Users can capture images of ingredients, and the app generates recipes using a backend integrated with Firebase and Large Language Models (LLMs).

## Features

- **AI-Powered Recipe Generator**: Generate recipes based on images of ingredients.
- **Real-Time Image Capture**: Capture or upload ingredient images directly through the app.
- **Firebase Integration**: 
  - **Authentication**: Secure user sign-up and login.
  - **Database**: Store user preferences, such as favorite recipes and profile details.
- **Personalized User Experience**:
  - Save favorite recipes for quick access.
  - View user-specific details on a dedicated profile screen.
- **Modern UI**: Intuitive and visually appealing interface with easy navigation.

## Project Structure

### Frontend:
- **Flutter**: Handles the user interface, image capturing, and seamless interaction.

### Backend:
- **Node.js**: Processes image URLs and generates recipes using AI.
- **Firebase**: 
  - Real-time database for storing data.
  - Cloud Storage for saving captured images.

## How It Works

1. **Capture or Upload Ingredients**:
   - Users can take a photo of their ingredients or upload an image from the gallery.
2. **Image Processing**:
   - The image is uploaded to Firebase Cloud Storage.
   - The app sends the image URL and session ID to the backend.
3. **Recipe Generation**:
   - The AI backend processes the image and generates a recipe.
4. **Display and Interaction**:
   - The generated recipe is displayed on the app.
   - Users can mark recipes as favorites.