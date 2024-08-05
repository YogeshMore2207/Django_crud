# Blog API

This is a simple Blog API built with Django and Django Rest Framework. It allows users to register, authenticate using JWT tokens, and perform CRUD operations on blog posts.

## Features

- User Registration
- User Authentication using JWT
- Create, Read, Update, and Delete (CRUD) operations for blog posts
- Permission-based access control
- Owner-specific access for updating and deleting posts

## Technologies Used

- Django
- Django Rest Framework
- JWT Authentication

## Installation

### Prerequisites

- Python 3.x
- Django 3.x
- Django Rest Framework
- Simple JWT for authentication

### Steps

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/yourusername/blog-api.git
   cd blog-api
   ```

2. **Create a Virtual Environment:**

   ```bash
   python -m venv env
   ```

3. **Activate the Virtual Environment:**

   - On Windows:

     ```bash
     .\env\Scripts\activate
     ```

   - On macOS and Linux:

     ```bash
     source env/bin/activate
     ```

4. **Install Dependencies:**

   ```bash
   pip install -r requirements.txt
   ```

5. **Run Migrations:**

   ```bash
   python manage.py migrate
   ```

6. **Start the Development Server:**

   ```bash
   python manage.py runserver
   ```

## Usage

### API Endpoints

#### Authentication

- **Register a new user**

  - **URL:** `/api/register/`
  - **Method:** `POST`
  - **Body:**
    ```json
    {
      "username": "your_username",
      "email": "your_email@example.com",
      "password": "your_password"
    }
    ```
  - **Response:**
    ```json
    {
      "id": 1,
      "username": "your_username",
      "email": "your_email@example.com"
    }
    ```

- **Obtain JWT Token**

  - **URL:** `/api/token/`
  - **Method:** `POST`
  - **Body:**
    ```json
    {
      "username": "your_username",
      "password": "your_password"
    }
    ```
  - **Response:**
    ```json
    {
      "refresh": "your_refresh_token",
      "access": "your_access_token"
    }
    ```

- **Refresh JWT Token**

  - **URL:** `/api/token/refresh/`
  - **Method:** `POST`
  - **Body:**
    ```json
    {
      "refresh": "your_refresh_token"
    }
    ```
  - **Response:**
    ```json
    {
      "access": "new_access_token"
    }
    ```

#### Posts

- **List all posts**

  - **URL:** `/api/posts/`
  - **Method:** `GET`
  - **Response:**
    ```json
    [
      {
        "id": 1,
        "title": "Post Title",
        "content": "Post content",
        "author": "author_username",
        "created_at": "2023-01-01T00:00:00Z",
        "updated_at": "2023-01-01T00:00:00Z"
      },
      ...
    ]
    ```

- **Create a new post**

  - **URL:** `/api/posts/`
  - **Method:** `POST`
  - **Headers:** `Authorization: Bearer your_access_token`
  - **Body:**
    ```json
    {
      "title": "Post Title",
      "content": "Post content"
    }
    ```
  - **Response:**
    ```json
    {
      "id": 1,
      "title": "Post Title",
      "content": "Post content",
      "author": "author_username",
      "created_at": "2023-01-01T00:00:00Z",
      "updated_at": "2023-01-01T00:00:00Z"
    }
    ```

- **Retrieve a post**

  - **URL:** `/api/posts/<int:pk>/`
  - **Method:** `GET`
  - **Response:**
    ```json
    {
      "id": 1,
      "title": "Post Title",
      "content": "Post content",
      "author": "author_username",
      "created_at": "2023-01-01T00:00:00Z",
      "updated_at": "2023-01-01T00:00:00Z"
    }
    ```

- **Update a post**

  - **URL:** `/api/posts/<int:pk>/`
  - **Method:** `PUT`
  - **Headers:** `Authorization: Bearer your_access_token`
  - **Body:**
    ```json
    {
      "title": "Updated Title",
      "content": "Updated content"
    }
    ```
  - **Response:**
    ```json
    {
      "id": 1,
      "title": "Updated Title",
      "content": "Updated content",
      "author": "author_username",
      "created_at": "2023-01-01T00:00:00Z",
      "updated_at": "2023-01-01T00:00:00Z"
    }
    ```

- **Delete a post**

  - **URL:** `/api/posts/<int:pk>/`
  - **Method:** `DELETE`
  - **Headers:** `Authorization: Bearer your_access_token`
  - **Response:** `204 No Content`

## Permissions

- **Registration** is open to everyone.
- **Post Listing** is available to all users.
- **Creating, Updating, and Deleting Posts** require authentication. Only the author of a post can update or delete it.

## Running Tests

To run tests, execute:

```bash
python manage.py test
```

## Folder Structure

- **`views.py`**: Contains the views for handling requests.
- **`urls.py`**: Defines the API endpoints.
- **`serializers.py`**: Serializers for converting data between types.
- **`models.py`**: Database models for the application.

