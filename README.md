# Flutter-Clean-Architecture
Flutter clean architecture using Getx Following MVVM Pattern


##  Overview
This project follows a structured approach to building scalable Flutter applications with GetX for state management and dependency injection. It implements Clean Architecture to separate concerns and improve maintainability.

##  Features
- **GetX for State Management**
- **MVVM Architecture**
- **Dio for API Calls**
- **Interceptor for API Authorization**
- **Caching with DioCacheInterceptor**
- **Shared Preferences for Local Storage**
- **SOLID Principles Implementation**

##  Project Structure
```
lib/
│
├── common/                # Shared utilities, themes, constants
│
├── app/                  
│   ├── exceptions/        # Custom exception handling
│   ├── global_widgets/    # Reusable UI components
│   ├── middlewares/       # Route guards and middlewares
│   ├── models/            # Entity definitions (business models)
│   ├── modules/           # Feature-based segregation 
│   │   ├── auth/          
│   │   │   ├── bindings/      # Dependency bindings
│   │   │   ├── controllers/   # State management using GetX
│   │   │   ├── services/      # Business logic and use cases
│   │   │   ├── views/         # UI components
│   │   │   ├── widgets/       # Reusable widgets on module level
│   │   ├── dashboard/        
│   │   ├── root/          # Root navigation & app entry point
│   ├── providers/         # API services and data sources
│   ├── routes/            # Navigation and route management
│   ├── services/          # Global services (e.g., Auth, Storage)
│
├── main.dart              # Application entry point
```

