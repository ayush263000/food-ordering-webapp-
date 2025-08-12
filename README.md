# 🍽️ Foodie Express

A Java web application for online food ordering built with Servlets, JSP, and MySQL.

## 📋 Table of Contents
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Database Setup](#database-setup)
- [Installation & Setup](#installation--setup)
- [Running the Application](#running-the-application)
- [Usage](#usage)
- [API Endpoints](#api-endpoints)
- [Screenshots](#screenshots)
- [Contributing](#contributing)
- [License](#license)

## ✨ Features

- **User Management**
  - User registration and login
  - Session management
  - Secure authentication

- **Food Catalog**
  - Browse available food items
  - View food details (name, price, restaurant, type, rating)
  - Search and filter functionality
  - Sort by price or rating

- **Shopping Cart**
  - Add items to cart
  - Manage item quantities
  - Remove items from cart
  - Real-time cart updates

- **Order Processing**
  - Checkout process
  - Payment simulation
  - Order confirmation
  - Order history storage

- **Responsive Design**
  - Bootstrap-based UI
  - Mobile-friendly interface
  - Clean and intuitive design

## 🛠️ Technologies Used

- **Backend:**
  - Java 17
  - Jakarta Servlets 6.0
  - JSP (JavaServer Pages)
  - JDBC for database connectivity

- **Frontend:**
  - HTML5, CSS3
  - Bootstrap 5.3
  - JavaScript

- **Database:**
  - MySQL 8.0

- **Build Tool:**
  - Maven 3.x

- **Server:**
  - Apache Tomcat 10.x (or any Jakarta EE compatible server)

## 📁 Project Structure

```
Foodie/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/
│   │   │       └── foodie/
│   │   │           ├── controller/         # Servlet controllers
│   │   │           │   ├── LoginServlet.java
│   │   │           │   ├── RegisterServlet.java
│   │   │           │   ├── FoodListServlet.java
│   │   │           │   ├── AddToCartServlet.java
│   │   │           │   ├── RemoveFromCartServlet.java
│   │   │           │   ├── CheckoutServlet.java
│   │   │           │   ├── PaymentServlet.java
│   │   │           │   └── OrderServlet.java
│   │   │           ├── dao/                # Data Access Objects
│   │   │           │   ├── UserDAO.java
│   │   │           │   ├── FoodDAO.java
│   │   │           │   └── OrderDAO.java
│   │   │           ├── model/              # Data models
│   │   │           │   ├── User.java
│   │   │           │   ├── FoodItem.java
│   │   │           │   ├── CartItem.java
│   │   │           │   └── Order.java
│   │   │           └── util/               # Utility classes
│   │   │               └── DBConnection.java
│   │   └── webapp/
│   │       ├── WEB-INF/
│   │       │   └── web.xml                 # Web application descriptor
│   │       ├── index.jsp                   # Home page
│   │       ├── login.jsp                   # Login page
│   │       ├── register.jsp                # Registration page
│   │       ├── cart.jsp                    # Shopping cart
│   │       ├── checkout.jsp                # Checkout page
│   │       ├── payment.jsp                 # Payment page
│   │       ├── orderSuccess.jsp            # Order confirmation
│   │       ├── foodlist.jsp                # Food listing page
│   │       └── logout.jsp                  # Logout page
│   └── test/                               # Test files
├── target/                                 # Build output (auto-generated)
├── pom.xml                                 # Maven configuration
├── .gitignore                              # Git ignore rules
├── database.properties.template            # Configuration template (copy to database.properties)
└── README.md                               # Project documentation
```

## 📋 Prerequisites

Before running this application, make sure you have the following installed:

- **Java Development Kit (JDK) 17** or higher
- **Apache Maven 3.6** or higher
- **MySQL 8.0** or higher
- **Apache Tomcat 10.x** or any Jakarta EE compatible application server
- **Git** (for version control)

## 🗄️ Database Setup

1. **Install MySQL** and start the MySQL service

2. **Create Database:**
   ```sql
   CREATE DATABASE foodie_db;
   USE foodie_db;
   ```

3. **Create Tables:**
   ```sql
   -- Users table
   CREATE TABLE user (
       id INT AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(100) NOT NULL,
       email VARCHAR(100) UNIQUE NOT NULL,
       password VARCHAR(255) NOT NULL,
       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
   );

   -- Food items table
   CREATE TABLE food_item (
       id INT AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(100) NOT NULL,
       price DECIMAL(10,2) NOT NULL,
       restaurant_name VARCHAR(100) NOT NULL,
       type VARCHAR(50) NOT NULL,
       rating FLOAT DEFAULT 0,
       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
   );

   -- Orders table
   CREATE TABLE orders (
       id INT AUTO_INCREMENT PRIMARY KEY,
       user_id INT NOT NULL,
       food_item_id INT NOT NULL,
       order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
       FOREIGN KEY (user_id) REFERENCES user(id),
       FOREIGN KEY (food_item_id) REFERENCES food_item(id)
   );
   ```

4. **Insert Sample Data:**
   ```sql
   INSERT INTO food_item (name, price, restaurant_name, type, rating) VALUES
   ('Pizza', 249.00, 'Pizza Palace', 'Italian', 4.5),
   ('Burger', 149.00, 'Burger King', 'Fast Food', 4.2),
   ('Fries', 99.00, 'McDonald\'s', 'Fast Food', 4.0),
   ('Biryani', 199.00, 'Biryani House', 'Indian', 4.7),
   ('Pasta', 179.00, 'Italian Corner', 'Italian', 4.3),
   ('Momos', 129.00, 'Momo Point', 'Chinese', 4.4),
   ('Sandwich', 89.00, 'Sandwich Bar', 'Fast Food', 4.1),
   ('Ice Cream', 79.00, 'Cold Stone', 'Dessert', 4.6);
   ```

5. **Configure Database Properties:**
   
   **✅ SECURITY IMPROVEMENT**: Database configuration is now externalized to properties files.
   
   - Copy `database.properties.template` to `database.properties`:
     ```bash
     cp database.properties.template database.properties
     ```
   
   - Update `database.properties` with your actual credentials:
     ```properties
     db.url=jdbc:mysql://localhost:3306/foodie_db?useSSL=false&serverTimezone=UTC
     db.username=your_mysql_username
     db.password=your_mysql_password
     db.driver=com.mysql.cj.jdbc.Driver
     ```
   
   - The application will automatically load configuration from:
     1. `src/main/resources/database.properties` (preferred for packaging)
     2. `database.properties` in project root (for development)
     3. Default values if no properties file is found

6. **Test Database Connection:**
   ```bash
   # Compile and run the test class
   mvn compile exec:java -Dexec.mainClass="com.foodie.util.DBConnectionTest"
   ```

## 🚀 Installation & Setup

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/your-username/foodie-express.git
   cd foodie-express
   ```

2. **Build the Project:**
   ```bash
   mvn clean compile
   ```

3. **Package the Application:**
   ```bash
   mvn clean package
   ```

## ▶️ Running the Application

### Option 1: Using Maven Tomcat Plugin
```bash
mvn tomcat7:run
```

### Option 2: Deploy to Tomcat Server
1. Copy the generated `target/FoodieExpress.war` to your Tomcat `webapps` directory
2. Start Tomcat server
3. Access the application at `http://localhost:8080/FoodieExpress`

### Option 3: Using IDE
1. Import the project into your IDE (Eclipse, IntelliJ IDEA)
2. Configure Tomcat server in your IDE
3. Deploy and run the project

## 🎯 Usage

### ⚠️ Security Notice
**Before deploying or sharing this code:**
1. Remove hardcoded database credentials from `DBConnection.java`
2. Create external configuration files (already added to `.gitignore`)
3. Implement proper password hashing
4. Add input validation to prevent SQL injection and XSS

### User Registration & Login
1. Navigate to the application homepage
2. Click "Register" to create a new account
3. Fill in your details and submit
4. Login with your credentials

### Browse Food Items
1. After login, browse available food items on the homepage
2. Use the "Foods" section to search and filter items
3. Sort by price or rating

### Shopping Cart
1. Click "Add to Cart" for any food item
2. View cart by clicking the cart icon
3. Manage quantities using +/- buttons
4. Remove items as needed

### Place Order
1. Go to cart and click "Proceed to Checkout"
2. Review your order details
3. Fill in payment information (simulation)
4. Confirm your order

## 🔗 API Endpoints

| Endpoint | Method | Description |
|----------|---------|-------------|
| `/login` | POST | User authentication |
| `/register` | POST | User registration |
| `/foods` | GET | Get food items with search/filter |
| `/addToCart` | POST | Add item to cart |
| `/removeFromCart` | POST | Remove item from cart |
| `/checkoutServlet` | POST | Initiate checkout |
| `/processPayment` | POST | Process payment |
| `/order` | POST | Place order |

## 📱 Screenshots

*Add screenshots of your application here*

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/new-feature`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature/new-feature`)
5. Create a Pull Request

## 📝 Development Notes

- The application uses session-based cart management
- Payment processing is simulated (no real payment gateway integration)
- **⚠️ Security Note**: Database credentials are currently hardcoded - externalize before production
- Bootstrap is used for responsive design
- All user inputs should be validated on both client and server side
- Consider implementing connection pooling for better database performance
- Use HTTPS in production for secure data transmission

## 🐛 Known Issues

- ~~**🚨 CRITICAL**: Database credentials are hardcoded in source code~~ ✅ **FIXED**: Now using external properties files
- Password storage is in plain text (implement password hashing)
- No input validation for XSS prevention
- Limited error handling and logging
- No email verification for registration
- No CSRF protection
- Session management could be improved

## 🔮 Future Enhancements

- ~~[ ] **🚨 HIGH PRIORITY**: Externalize database configuration to properties file~~ ✅ **COMPLETED**
- [ ] Implement password hashing (BCrypt)
- [ ] Add input validation and XSS prevention
- [ ] Implement CSRF protection
- [ ] Add comprehensive error handling and logging
- [ ] Add email verification
- [ ] Integrate real payment gateway
- [ ] Add admin panel for managing food items
- [ ] Implement order tracking
- [ ] Add user profile management
- [ ] Implement reviews and ratings
- [ ] Add food categories and images
- [ ] Mobile app development
- [ ] Add unit and integration tests
- [ ] Implement caching for better performance
- [ ] Add connection pooling for database

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Your Name**
- GitHub: [@your-username](https://github.com/your-username)
- Email: your.email@example.com

## 🙏 Acknowledgments

- Bootstrap team for the UI framework
- MySQL for the database
- Apache Tomcat for the servlet container
- Maven for build management

---

### 📞 Support

If you have any questions or need help with setup, please feel free to:
- Open an issue on GitHub
- Contact the development team
- Check the documentation

**Happy Coding! 🚀**
