# Architecture Document

## 1. System Architecture Diagram

### High-Level Architecture

Components:
- Client (Browser)
- Frontend Application
- Backend API Server
- Authentication Service
- Database

Flow:
1. User accesses the system through a browser.
2. Browser communicates with the frontend application.
3. Frontend sends API requests to the backend server.
4. Backend validates authentication using JWT.
5. Backend interacts with the database using tenant context.
6. Responses are returned back to the frontend.

Diagram Location:
docs/images/system-architecture.png

---

## 2. Database Schema Design

### Entities

#### Tenant
- id (PK)
- name
- subdomain
- created_at

#### User
- id (PK)
- tenant_id (FK)
- name
- email
- password_hash
- role
- created_at

#### Project
- id (PK)
- tenant_id (FK)
- name
- description
- created_at

#### Task
- id (PK)
- tenant_id (FK)
- project_id (FK)
- title
- status
- assigned_to
- created_at

### Relationships
- Tenant has many Users
- Tenant has many Projects
- Project has many Tasks
- User can be assigned many Tasks

### Indexes
- Index on tenant_id in all tables
- Index on email in User table
- Index on project_id in Task table

ERD Location:
docs/images/database-erd.png

---

## 3. API Architecture

### Auth Module
- POST /auth/register (Public)
- POST /auth/login (Public)
- POST /auth/logout (Authenticated)

### Tenants Module
- POST /tenants (Super Admin)
- GET /tenants (Super Admin)
- GET /tenants/:id (Super Admin)

### Users Module
- POST /users (Tenant Admin)
- GET /users (Tenant Admin)
- GET /users/:id (Authenticated)
- PUT /users/:id (Tenant Admin)
- DELETE /users/:id (Tenant Admin)

### Projects Module
- POST /projects (Authenticated)
- GET /projects (Authenticated)
- PUT /projects/:id (Authenticated)
- DELETE /projects/:id (Tenant Admin)

### Tasks Module
- POST /tasks (Authenticated)
- GET /tasks (Authenticated)
- PUT /tasks/:id (Authenticated)
- DELETE /tasks/:id (Authenticated)
