# Enterprise Ticketing System

A Flutter application for managing enterprise ticketing and asset management operations.

## 🏗️ Project Structure

The project has been refactored to follow clean code principles with a well-organized structure:

```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models
│   ├── ticket.dart
│   ├── preventive_ticket.dart
│   ├── pic_user.dart
│   ├── ticket_log.dart
│   └── notification_item.dart
├── pages/                    # UI pages
│   ├── login_page.dart
│   ├── main_page.dart
│   ├── dashboard_page.dart
│   ├── tickets_page.dart
│   ├── notifications_page.dart
│   └── profile_page.dart
├── utils/                    # Utilities and helpers
│   ├── constants.dart
│   ├── status_helper.dart
│   └── date_formatter.dart
└── data/                     # Data sources
    └── dummy_data.dart
```

## 🎯 Features

-   **Authentication**: Login system with email/password
-   **Dashboard**: Overview with statistics and recent tickets
-   **Ticket Management**:
    -   Corrective tickets (repair/maintenance)
    -   Preventive tickets (scheduled maintenance)
    -   Status filtering and tracking
-   **Notifications**: Real-time notifications for ticket updates
-   **Profile Management**: User profile and settings

## 🎨 Design Principles

### Clean Code Structure

-   **Separation of Concerns**: Models, UI, and business logic are separated
-   **Single Responsibility**: Each class has a single, well-defined purpose
-   **DRY Principle**: Common utilities and constants are centralized
-   **Consistent Naming**: Clear, descriptive names for all components

### Code Organization

-   **Models**: Data structures with clear properties and constructors
-   **Pages**: UI components organized by feature
-   **Utils**: Reusable helper classes and constants
-   **Data**: Centralized data management

### Maintainability

-   **Constants**: App-wide constants in `constants.dart`
-   **Status Management**: Centralized status colors and icons
-   **Date Formatting**: Consistent date/time formatting utilities
-   **Dummy Data**: Organized test data for development

## 🚀 Getting Started

1. **Install Dependencies**:

    ```bash
    flutter pub get
    ```

2. **Run the App**:
    ```bash
    flutter run
    ```

## 📱 App Flow

1. **Login**: User authentication with email/password
2. **Dashboard**: Overview of tickets and statistics
3. **Tickets**: Browse and filter corrective/preventive tickets
4. **Notifications**: View and manage notifications
5. **Profile**: User information and settings

## 🎨 UI/UX Features

-   **Material Design 3**: Modern, consistent design language
-   **Responsive Layout**: Adapts to different screen sizes
-   **Status Indicators**: Color-coded status for easy identification
-   **Intuitive Navigation**: Bottom navigation for easy access
-   **Loading States**: Proper loading indicators and feedback

## 🔧 Technical Implementation

### State Management

-   Uses Flutter's built-in state management
-   Local state for UI interactions
-   Centralized data management

### Navigation

-   Bottom navigation for main sections
-   Tab navigation for ticket types
-   Modal dialogs for actions

### Data Flow

-   Models define data structure
-   Dummy data provides test data
-   Utilities handle common operations

## 🛠️ Development Guidelines

### Adding New Features

1. Create models in `lib/models/`
2. Add pages in `lib/pages/`
3. Update constants in `lib/utils/constants.dart`
4. Add dummy data in `lib/data/dummy_data.dart`

### Code Style

-   Follow Flutter conventions
-   Use meaningful variable names
-   Add comments for complex logic
-   Keep methods small and focused

### Testing

-   Use dummy data for development
-   Test different screen sizes
-   Verify status flows work correctly

## 📋 Future Enhancements

-   [ ] API integration for real data
-   [ ] Push notifications
-   [ ] Offline support
-   [ ] Advanced filtering
-   [ ] Photo capture and upload
-   [ ] Real-time updates
-   [ ] User roles and permissions

## 🤝 Contributing

1. Follow the established code structure
2. Use the provided utilities and constants
3. Maintain consistency with existing patterns
4. Test thoroughly before submitting

---

**Note**: This is a refactored version of the original monolithic code, now following clean code principles for better maintainability and scalability.
