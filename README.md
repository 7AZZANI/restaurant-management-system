<div align="center">

# 🍽️ Restaurant Menu — Open-Source Digital Ordering & Management System

**A modern, real-time restaurant digital menu, table ordering platform, kitchen dashboard, and recipe inventory tracker built with Django, Channels (WebSockets), and Tailwind CSS.**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Python](https://img.shields.io/badge/Python-3.10%2B-blue.svg)](https://www.python.org/)
[![Django](https://img.shields.io/badge/Django-4.1%2B-092E20.svg)](https://www.djangoproject.com/)
[![Tailwind CSS](https://img.shields.io/badge/Tailwind-CSS%20%26%20DaisyUI-38B2AC.svg)](https://tailwindcss.com/)
[![WebSockets](https://img.shields.io/badge/WebSockets-Django%20Channels-orange.svg)](https://channels.readthedocs.io/)
[![Donate](https://img.shields.io/badge/Support%20%26%20Donate-7AZZANI.COM-ff69b4.svg)](https://7azzani.com/donation/)

[Features](#-key-features) • [Quick Start](#-quick-start--installation) • [Sample Data](#-sample-data-seeding) • [Project Structure](#-project-structure) • [License](#-license--usage-rights) • [Support & Donations](#-support--donations)

</div>

---

## 🌟 Overview

**Restaurant Menu** is a production-style, open-source restaurant solution designed for restaurants, cafes, food trucks, and hospitality developers. It provides customers with an interactive digital table menu to place orders directly from their phones or tablets, while the kitchen and management staff monitor incoming orders in real-time through a live WebSocket-powered dashboard.

### 💖 Free & Open Source for Everyone
This project is open-source under the **MIT License**. You are completely free to:
* Use it for your own restaurant or cafe.
* Use it as a client template or foundation for your commercial projects.
* Customize, extend, and rebrand it to fit your unique design.
* Retain the "Built with ❤️ by [7AZZANI.COM](https://7azzani.com)" attribution to support the creator!

---

## ✨ Key Features

### 📱 Customer-Facing Digital Menu
* **Category Browsing & Filtering**: Clean, responsive grid displaying categories, dish images, descriptions, portion availability, and prices.
* **Compact Menu Mode**: A dual-column fast-scan layout for quick table ordering.
* **Client-Side Cart**: Browser-persisted cart (`localStorage`) with animated badge counters and item quantity adjustments.
* **Table-Based Ordering**: Customers select their table number (1–10) and confirm orders without calling a waiter.
* **Real-Time Order Tracking**: Order status lookup page (`/check-order/`) for customers to track their pending or served status.

### 👨‍🍳 Kitchen & Admin Live Operations Dashboard
* **Real-Time WebSockets Feed**: Live incoming orders update instantly on the kitchen dashboard without manual browser refreshes.
* **Recipe-Based Automated Stock Depletion**: When an order is created, the system calculates and deducts raw recipe ingredients (e.g., grams of meat, milliliters of sauce) directly from warehouse stock.
* **Low Inventory Alerts**: Instant visual banner when any ingredient drops below its predefined minimum threshold.
* **Interactive Chart.js Analytics**: Visual breakdown of inventory stock distribution (doughnut chart) and sales revenue filtered by week, month, or year (bar chart).
* **DaisyUI / Tailwind Overhaul**: Customized Django Admin interface transformed into a sleek modern control panel.
* **WebPush Notification Support**: Browser push notifications dispatched to staff upon new order placements.

---

## 🚀 Quick Start & Installation

### 1. Prerequisites
* **Python 3.10** or higher
* **Git** installed on your machine
* Optional: **PostgreSQL** & **Redis** (The system runs automatically with SQLite and in-memory WebSockets out of the box for quick setup!).

---

### 2. Clone the Repository
```bash
git clone https://github.com/your-username/restaurant-management-system.git
cd restaurant-management-system
```

---

### 3. Create & Activate Virtual Environment

**Windows (PowerShell):**
```powershell
python -m venv env
.\env\Scripts\Activate.ps1
```

**macOS / Linux:**
```bash
python3 -m venv env
source env/bin/activate
```

---

### 4. Install Dependencies
```bash
pip install -r requirements.txt
```

---

### 5. Configure Environment Variables (`.env`)
Create a `.env` file in the root directory (or use default development fallbacks):

```ini
# Security (Set a strong secret in production)
SECRET_KEY=your-secure-secret-key-here
DEBUG=True
ALLOWED_HOSTS=*

# Database: Leave empty or comment out to use built-in SQLite (db.sqlite3)
# To use PostgreSQL, uncomment and provide connection string:
# DATABASE_URL=postgres://username:password@localhost:5432/rms_db

# Redis / Channels: Leave empty for local InMemoryChannelLayer (Zero configuration!)
# To use Redis in production, uncomment:
# REDIS_URL=redis://localhost:6379
```

---

### 6. Run Database Migrations
Create the database schema and initialize the tables:
```bash
python manage.py migrate
```

---

### 7. Seed Sample Menu & Admin Data
Load 55 real dishes, 9 categories, units, ingredients, and recipes:
```bash
python load_data.py
```

This creates the default superuser:
* **Admin URL**: `http://127.0.0.1:8000/admin/`
* **Email / Username**: `admin@rms.com`
* **Password**: `admin123`

---

### 8. Start the Real-Time Development Server
Run the ASGI development server (supports HTTP + Channels WebSockets):
```bash
python manage.py runserver
```

Open your browser at:
* 🌐 **Customer Menu**: [http://127.0.0.1:8000/](http://127.0.0.1:8000/)
* 📋 **Compact Menu**: [http://127.0.0.1:8000/compact-menu/](http://127.0.0.1:8000/compact-menu/)
* 🔍 **Check Orders**: [http://127.0.0.1:8000/check-order/](http://127.0.0.1:8000/check-order/)
* 📊 **Kitchen / Admin Dashboard**: [http://127.0.0.1:8000/admin/](http://127.0.0.1:8000/admin/)

---

## 📁 Project Structure

```
restaurant-management-system/
├── core/                       # Core Django project configuration
│   ├── asgi.py                 # ASGI application routing (HTTP & WebSockets)
│   ├── consumers.py            # Channels WebSocket consumers (Admin dashboard)
│   ├── context_processors.py   # Global dashboard analytics context
│   ├── routing.py              # WebSocket URL router
│   ├── settings.py             # Project settings (SQLite/Postgres, Channels)
│   ├── urls.py                 # Root URL configuration
│   ├── utils.py                # Sales and inventory analytics helpers
│   └── static/                 # Static assets (JS, CSS, Icons, Logos)
│
├── account/                    # User authentication & custom User model
│   ├── models.py               # Custom User with email authentication
│   └── admin.py                # Admin configuration for user management
│
├── management/                 # Restaurant domain & business logic
│   ├── models.py               # Categories, FoodItems, Ingredients, Orders
│   ├── admin.py                # Customized ModelAdmin views and actions
│   ├── views.py                # API endpoints (Order submission, status mutation)
│   ├── urls.py                 # Management routes (/order/, /order/action/)
│   └── utils.py                # Recipe quantity calculations & live dispatches
│
├── templates/                  # Frontend HTML templates (Tailwind + DaisyUI)
│   ├── index.html              # Base layout
│   ├── home.html               # Main visual category menu
│   ├── compact-menu.html       # Compact list menu view
│   ├── food-items.html         # Category items detail & order buttons
│   ├── check-order.html        # Order status tracking screen
│   ├── components/             # Reusable UI fragments (Navbar, Footer, Modal)
│   └── admin/                  # Overridden Django admin dashboard templates
│
├── media/                      # Uploaded dish images & category thumbnails
├── jstools/                    # Tailwind CSS & DaisyUI compilation setup
├── load_data.py                # Database population script
├── requirements.txt            # Python dependencies
└── manage.py                   # Django CLI entrypoint
```

---

## 🎨 Customizing for Your Restaurant

1. **Change Brand Name & Logo**:
   * Replace [core/static/images/logo.png](core/static/images/logo.png) with your restaurant logo.
   * Edit [templates/components/navbar.html](templates/components/navbar.html) to adjust your restaurant name and tagline.
2. **Add Categories & Dishes**:
   * Navigate to the Admin Panel (`/admin/`), log in, and manage `Categories`, `Food Items`, `Ingredients`, and recipes.
3. **Change Currency & Pricing**:
   * Search for `/-` or update the currency symbol in `templates/food-items.html` and `templates/check-order.html` to `$` or your local currency.
4. **Tailwind Theme Styling**:
   * Edit `jstools/tailwind.config.js` to change the primary and secondary color palette.

---

## 📜 License & Usage Rights

This project is licensed under the **MIT License** — you are free to download, fork, modify, use commercially, and deploy this software in any personal or client project.

**Attribution Notice**:  
Please maintain the author attribution:
> *Built with ❤️ by [7AZZANI.COM](https://7azzani.com)*

in the project footer or documentation when deploying or redistributing this template.

---

## ☕ Support & Donations

If this project saved you development time, helped your business, or provided value to your workflow, please consider supporting the creator! Your support helps maintain, update, and release more high-quality open-source projects.

<div align="center">

### 💖 [Support & Donate to 7AZZANI.COM](https://7azzani.com/donation/)

[![Donate](https://img.shields.io/badge/Donate-7AZZANI.COM-ff69b4?style=for-the-badge&logo=heart)](https://7azzani.com/donation/)

**Website**: [https://7azzani.com](https://7azzani.com)  
**Donation Page**: [https://7azzani.com/donation/](https://7azzani.com/donation/)

*Thank you for supporting open-source software!*

</div>
