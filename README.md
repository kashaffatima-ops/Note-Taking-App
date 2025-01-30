# **Note-Taking App with Firebase**  

## **Project Overview**  
The **Note-Taking App** is a Flutter-based mobile application that allows users to create, edit, delete, and manage notes efficiently. The app uses **Firebase Authentication** for secure user login and **Firestore** for storing user notes.  

## **Features**  

### **1. Firebase Authentication**  
- Users can sign up and log in using **email/password authentication** (Firebase Auth).  
- Only authenticated users can access their saved notes.  

### **2. Note Management (CRUD operations)**  
- Users can **add, update, and delete** their notes.  
- Notes are stored under the authenticated user's **Firestore document**.  
- Each note contains:  
  - `noteId` (Unique Identifier)  
  - `title` (String)  
  - `description` (String)  

---

## **Project Structure (MVVM Architecture)**  
The project follows the **Model-View-ViewModel (MVVM)** pattern for better separation of concerns.  


## **Setup & Installation**  

### **1. Firebase Setup**  
- Create a new **Firebase project** in the Firebase console.  
- Enable **Authentication** (Email/Password).  
- Enable **Firestore Database** in test mode.  
- Add your **Google-Services.json** (for Android) or **Google-Info.plist** (for iOS) to the Flutter project.  

### **2. Flutter Dependencies**  
Add the following dependencies in `pubspec.yaml`:  
```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.2
  firebase_core: ^3.10.1
  firebase_auth: ^5.4.1
  cloud_firestore: ^5.6.2
```
Then, run:  
```sh
flutter pub get
```

### **3. Running the App**  
After setting up Firebase, run the following command in your terminal:  
```sh
flutter run
```

---

## **Firestore Rules** (Security Rules for Authentication)  
```json
rules_version = '2';

service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if request.time < timestamp.date(2025, 3, 1);
    }
  }
}
```
- Only **authenticated users** can read and write their own notes.
