========================================================================
🍽️ RESTAURANT MENU - DIGITAL ORDERING & INVENTORY MANAGEMENT SYSTEM
========================================================================

Author: 7AZZANI (https://7azzani.com)
License: MIT License (Free for personal & commercial use with attribution)
Support & Donations: https://7azzani.com/donation/

PLEASE READ "README.md" FOR THE FULL DOCUMENTATION AND SETUP GUIDE!

QUICK START INSTRUCTIONS:
-------------------------
1. Create virtual environment:
   python -m venv env
   .\env\Scripts\activate

2. Install dependencies:
   pip install -r requirements.txt

3. Apply database migrations:
   python manage.py migrate

4. Seed sample menu & create admin account:
   python load_data.py

5. Run development server:
   python manage.py runserver

6. Open in browser:
   - Customer Menu: http://127.0.0.1:8000/
   - Admin Dashboard: http://127.0.0.1:8000/admin/
     Username: admin@rms.com
     Password: admin123

For full details, architecture overview, and customizations, see README.md.
========================================================================
