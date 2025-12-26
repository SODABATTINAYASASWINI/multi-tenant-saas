# Technical Specification

## 1. Project Structure

### Backend Structure

backend/
├── src/
│   ├── controllers/
│   ├── models/
│   ├── routes/
│   ├── middleware/
│   ├── utils/
│   └── config/
├── migrations/
└── tests/

Purpose:
- controllers: Request handling logic
- models: Database schemas
- routes: API endpoints
- middleware: Auth, validation, tenant checks
- utils: Helper functions
- config: Environment and DB config
- migrations: Database versioning
- tests: Unit and integration tests

---

### Frontend Structure

frontend/
├── src/
│   ├── components/
│   ├── pages/
│   ├── services/
│   ├── hooks/
│   └── utils/
└── public/

Purpose:
- components: Reusable UI components
- pages: Page-level components
- services: API calls
- hooks: Custom React hooks
- utils: Helper functions

---

## 2. Development Setup Guide

### Prerequisites
- Node.js v18+
- npm or yarn
- PostgreSQL

### Environment Variables
- DATABASE_URL
- JWT_SECRET
- PORT
- NODE_ENV

### Installation Steps
1. Clone repository
2. Install backend dependencies
3. Install frontend dependencies
4. Configure environment variables

### Run Locally
- Backend: `npm run dev`
- Frontend: `npm start`

### Run Tests
- Backend tests: `npm test`
