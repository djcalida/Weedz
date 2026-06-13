import random

ORDERS = [
    {"id": "WZ00100124", "customer": "Maria Santos",    "email": "maria.s@gmail.com",   "item_count": 3, "total": 14250, "status": "Delivered",   "payment": "GCash",       "date": "Jun 12, 2026", "address": "Quezon City, Metro Manila"},
    {"id": "WZ00100123", "customer": "Jose Reyes",      "email": "jose.r@yahoo.com",    "item_count": 1, "total": 4599,  "status": "Shipped",      "payment": "COD",         "date": "Jun 12, 2026", "address": "Makati, Metro Manila"},
    {"id": "WZ00100122", "customer": "Ana Dela Cruz",   "email": "ana.dc@gmail.com",    "item_count": 2, "total": 9090,  "status": "Processing",   "payment": "Card",        "date": "Jun 11, 2026", "address": "Cebu City, Cebu"},
    {"id": "WZ00100121", "customer": "Carlo Mendoza",   "email": "carlo.m@gmail.com",   "item_count": 4, "total": 26500, "status": "Delivered",    "payment": "GCash",       "date": "Jun 11, 2026", "address": "Davao City, Davao"},
    {"id": "WZ00100120", "customer": "Liza Tan",        "email": "liza.t@hotmail.com",  "item_count": 1, "total": 2199,  "status": "Cancelled",    "payment": "Bank",        "date": "Jun 10, 2026", "address": "Pasig, Metro Manila"},
    {"id": "WZ00100119", "customer": "Ben Villanueva",  "email": "ben.v@gmail.com",     "item_count": 2, "total": 11489, "status": "Delivered",    "payment": "COD",         "date": "Jun 10, 2026", "address": "Taguig, Metro Manila"},
    {"id": "WZ00100118", "customer": "Rosa Gomez",      "email": "rosa.g@gmail.com",    "item_count": 1, "total": 8750,  "status": "Shipped",      "payment": "GCash",       "date": "Jun 9, 2026",  "address": "Mandaluyong, Metro Manila"},
    {"id": "WZ00100117", "customer": "Mark Aquino",     "email": "mark.a@gmail.com",    "item_count": 3, "total": 19890, "status": "Delivered",    "payment": "Card",        "date": "Jun 9, 2026",  "address": "Las Piñas, Metro Manila"},
    {"id": "WZ00100116", "customer": "Tina Flores",     "email": "tina.f@yahoo.com",    "item_count": 2, "total": 7890,  "status": "Refund Req.",  "payment": "GCash",       "date": "Jun 8, 2026",  "address": "Caloocan, Metro Manila"},
    {"id": "WZ00100115", "customer": "Jake Castillo",   "email": "jake.c@gmail.com",    "item_count": 1, "total": 12499, "status": "Delivered",    "payment": "Bank",        "date": "Jun 8, 2026",  "address": "Parañaque, Metro Manila"},
    {"id": "WZ00100114", "customer": "Grace Lim",       "email": "grace.l@gmail.com",   "item_count": 2, "total": 6090,  "status": "Processing",   "payment": "COD",         "date": "Jun 7, 2026",  "address": "Antipolo, Rizal"},
    {"id": "WZ00100113", "customer": "Paul Navarro",    "email": "paul.n@gmail.com",    "item_count": 1, "total": 5499,  "status": "Delivered",    "payment": "GCash",       "date": "Jun 7, 2026",  "address": "Bacoor, Cavite"},
    {"id": "WZ00100112", "customer": "Amy Bautista",    "email": "amy.b@gmail.com",     "item_count": 5, "total": 34200, "status": "Shipped",      "payment": "Card",        "date": "Jun 6, 2026",  "address": "San Juan, Metro Manila"},
    {"id": "WZ00100111", "customer": "Rico Torres",     "email": "rico.t@hotmail.com",  "item_count": 1, "total": 1899,  "status": "Delivered",    "payment": "COD",         "date": "Jun 6, 2026",  "address": "Malabon, Metro Manila"},
    {"id": "WZ00100110", "customer": "Diana Cruz",      "email": "diana.c@gmail.com",   "item_count": 2, "total": 16740, "status": "Delivered",    "payment": "Bank",        "date": "Jun 5, 2026",  "address": "Navotas, Metro Manila"},
]

CUSTOMERS = [
    {"id": "C001", "name": "Maria Santos",   "email": "maria.s@gmail.com",  "phone": "+63 917 111 2222", "orders": 12, "total_spent": 82500,  "status": "Active",    "joined": "Jan 15, 2025", "city": "Quezon City"},
    {"id": "C002", "name": "Jose Reyes",     "email": "jose.r@yahoo.com",   "phone": "+63 918 222 3333", "orders": 5,  "total_spent": 23400,  "status": "Active",    "joined": "Mar 3, 2025",  "city": "Makati"},
    {"id": "C003", "name": "Ana Dela Cruz",  "email": "ana.dc@gmail.com",   "phone": "+63 919 333 4444", "orders": 8,  "total_spent": 45600,  "status": "Active",    "joined": "Feb 20, 2025", "city": "Cebu City"},
    {"id": "C004", "name": "Carlo Mendoza",  "email": "carlo.m@gmail.com",  "phone": "+63 917 444 5555", "orders": 21, "total_spent": 134800, "status": "VIP",       "joined": "Nov 5, 2024",  "city": "Davao City"},
    {"id": "C005", "name": "Liza Tan",       "email": "liza.t@hotmail.com", "phone": "+63 920 555 6666", "orders": 2,  "total_spent": 4098,   "status": "Inactive",  "joined": "May 10, 2026", "city": "Pasig"},
    {"id": "C006", "name": "Ben Villanueva", "email": "ben.v@gmail.com",    "phone": "+63 916 666 7777", "orders": 9,  "total_spent": 67200,  "status": "Active",    "joined": "Dec 1, 2024",  "city": "Taguig"},
    {"id": "C007", "name": "Rosa Gomez",     "email": "rosa.g@gmail.com",   "phone": "+63 917 777 8888", "orders": 4,  "total_spent": 19800,  "status": "Active",    "joined": "Apr 8, 2025",  "city": "Mandaluyong"},
    {"id": "C008", "name": "Mark Aquino",    "email": "mark.a@gmail.com",   "phone": "+63 918 888 9999", "orders": 16, "total_spent": 98400,  "status": "VIP",       "joined": "Sep 14, 2024", "city": "Las Piñas"},
    {"id": "C009", "name": "Tina Flores",    "email": "tina.f@yahoo.com",   "phone": "+63 919 999 0000", "orders": 3,  "total_spent": 12600,  "status": "Inactive",  "joined": "Jun 1, 2026",  "city": "Caloocan"},
    {"id": "C010", "name": "Jake Castillo",  "email": "jake.c@gmail.com",   "phone": "+63 917 000 1111", "orders": 7,  "total_spent": 56700,  "status": "Active",    "joined": "Jan 29, 2025", "city": "Parañaque"},
]

EMPLOYEES = [
    {"id": "E001", "name": "Admin Owner",    "email": "admin@wedzz.com",       "role": "Super Admin", "department": "Management",    "status": "Active", "last_login": "Jun 13, 2026 2:45 PM", "joined": "Jan 1, 2024"},
    {"id": "E002", "name": "Cris Vargas",    "email": "cris.v@wedzz.com",      "role": "Manager",     "department": "Operations",    "status": "Active", "last_login": "Jun 13, 2026 1:30 PM", "joined": "Mar 15, 2024"},
    {"id": "E003", "name": "Lily Ramos",     "email": "lily.r@wedzz.com",      "role": "Staff",       "department": "Sales",         "status": "Active", "last_login": "Jun 13, 2026 9:12 AM", "joined": "Jun 1, 2024"},
    {"id": "E004", "name": "Don Santos",     "email": "don.s@wedzz.com",       "role": "Staff",       "department": "Warehouse",     "status": "Active", "last_login": "Jun 12, 2026 5:00 PM", "joined": "Aug 10, 2024"},
    {"id": "E005", "name": "Mia Cruz",       "email": "mia.c@wedzz.com",       "role": "Staff",       "department": "Customer Svc",  "status": "Active", "last_login": "Jun 13, 2026 8:55 AM", "joined": "Oct 5, 2024"},
    {"id": "E006", "name": "Roy Macaraeg",   "email": "roy.m@wedzz.com",       "role": "Viewer",      "department": "Accounting",    "status": "Inactive","last_login": "Jun 1, 2026 3:00 PM",  "joined": "Feb 20, 2025"},
]

PROMOS = [
    {"id": "WEDZZ15",  "type": "Percentage", "value": 15,   "min_order": 0,    "uses": 142, "limit": 500, "status": "Active",   "expiry": "Dec 31, 2026", "desc": "15% off first order"},
    {"id": "FREESHIP", "type": "Free Ship",  "value": 150,  "min_order": 1500, "uses": 89,  "limit": 200, "status": "Active",   "expiry": "Jul 31, 2026", "desc": "Free shipping promo"},
    {"id": "SUMMER200","type": "Fixed",      "value": 200,  "min_order": 2000, "uses": 56,  "limit": 100, "status": "Active",   "expiry": "Jun 30, 2026", "desc": "₱200 off summer sale"},
    {"id": "VIP500",   "type": "Fixed",      "value": 500,  "min_order": 5000, "uses": 23,  "limit": 50,  "status": "Active",   "expiry": "Sep 30, 2026", "desc": "VIP customer exclusive"},
    {"id": "FLASH10",  "type": "Percentage", "value": 10,   "min_order": 0,    "uses": 300, "limit": 300, "status": "Expired",  "expiry": "May 31, 2026", "desc": "Flash sale 10% off"},
    {"id": "NEWYR",    "type": "Percentage", "value": 20,   "min_order": 3000, "uses": 412, "limit": 400, "status": "Expired",  "expiry": "Jan 31, 2026", "desc": "New Year 20% off"},
]

REFUNDS = [
    {"id": "RF001", "order": "WZ00100116", "customer": "Tina Flores",   "amount": 7890,  "reason": "Wrong part delivered",       "status": "Pending",   "date": "Jun 9, 2026",  "resolution": ""},
    {"id": "RF002", "order": "WZ00100098", "customer": "Rico Torres",   "amount": 1899,  "reason": "Item arrived damaged",        "status": "Approved",  "date": "Jun 5, 2026",  "resolution": "Full refund issued"},
    {"id": "RF003", "order": "WZ00100087", "customer": "Ana Dela Cruz", "amount": 6890,  "reason": "Changed mind",                "status": "Rejected",  "date": "May 28, 2026", "resolution": "Policy: no refund on opened items"},
    {"id": "RF004", "order": "WZ00100074", "customer": "Grace Lim",     "amount": 4599,  "reason": "Part not compatible",         "status": "Approved",  "date": "May 20, 2026", "resolution": "Exchange issued"},
    {"id": "RF005", "order": "WZ00100061", "customer": "Paul Navarro",  "amount": 5499,  "reason": "Defective product",           "status": "Processing","date": "May 15, 2026", "resolution": "Under review"},
    {"id": "RF006", "order": "WZ00100055", "customer": "Mark Aquino",   "amount": 12499, "reason": "Wrong spec received",         "status": "Approved",  "date": "May 10, 2026", "resolution": "Replacement dispatched"},
]

AUDIT_LOGS = [
    {"id": 1,  "user": "Admin Owner",  "action": "Updated product price",        "target": "Brembo Brake Pads",           "time": "Jun 13, 2026 2:44 PM",  "ip": "192.168.1.1",  "level": "info"},
    {"id": 2,  "user": "Cris Vargas",  "action": "Marked order Delivered",       "target": "WZ00100124",                  "time": "Jun 13, 2026 1:32 PM",  "ip": "192.168.1.5",  "level": "success"},
    {"id": 3,  "user": "Lily Ramos",   "action": "Added new promo code",         "target": "SUMMER200",                   "time": "Jun 13, 2026 9:15 AM",  "ip": "192.168.1.8",  "level": "info"},
    {"id": 4,  "user": "Admin Owner",  "action": "Deleted product",              "target": "Old Brake Pad SKU-001",       "time": "Jun 12, 2026 5:01 PM",  "ip": "192.168.1.1",  "level": "warning"},
    {"id": 5,  "user": "Don Santos",   "action": "Updated stock quantity",       "target": "NGK Spark Plugs (+50 units)", "time": "Jun 12, 2026 4:15 PM",  "ip": "192.168.1.12", "level": "info"},
    {"id": 6,  "user": "Mia Cruz",     "action": "Processed refund",             "target": "RF002 — Rico Torres",         "time": "Jun 12, 2026 2:00 PM",  "ip": "192.168.1.9",  "level": "success"},
    {"id": 7,  "user": "Admin Owner",  "action": "Login successful",             "target": "admin@wedzz.com",             "time": "Jun 12, 2026 8:30 AM",  "ip": "192.168.1.1",  "level": "info"},
    {"id": 8,  "user": "Roy Macaraeg", "action": "Failed login attempt",         "target": "roy.m@wedzz.com",             "time": "Jun 11, 2026 6:45 PM",  "ip": "203.177.23.4", "level": "danger"},
    {"id": 9,  "user": "Lily Ramos",   "action": "Exported sales report",        "target": "May 2026 Report",             "time": "Jun 11, 2026 3:10 PM",  "ip": "192.168.1.8",  "level": "info"},
    {"id": 10, "user": "Cris Vargas",  "action": "Created new employee account", "target": "mia.c@wedzz.com",             "time": "Jun 10, 2026 10:00 AM", "ip": "192.168.1.5",  "level": "info"},
    {"id": 11, "user": "Admin Owner",  "action": "Applied bulk discount",        "target": "Brakes category (−10%)",      "time": "Jun 10, 2026 9:00 AM",  "ip": "192.168.1.1",  "level": "warning"},
    {"id": 12, "user": "Don Santos",   "action": "Low stock alert triggered",    "target": "Exedy Clutch Kit (12 left)",  "time": "Jun 9, 2026 11:30 AM",  "ip": "system",       "level": "warning"},
]

SALES_MONTHLY = [
    {"month": "Jan", "revenue": 187400, "orders": 34, "returns": 2},
    {"month": "Feb", "revenue": 203100, "orders": 41, "returns": 3},
    {"month": "Mar", "revenue": 245600, "orders": 48, "returns": 4},
    {"month": "Apr", "revenue": 221800, "orders": 45, "returns": 2},
    {"month": "May", "revenue": 289300, "orders": 57, "returns": 5},
    {"month": "Jun", "revenue": 198500, "orders": 38, "returns": 3},
]

DASHBOARD_STATS = {
    "total_revenue":    {"value": "₱1,345,700", "change": "+12.4%",  "trend": "up",   "label": "Total Revenue",    "icon": "💰"},
    "total_orders":     {"value": "263",         "change": "+8.7%",   "trend": "up",   "label": "Total Orders",     "icon": "📦"},
    "total_customers":  {"value": "1,842",        "change": "+23.1%",  "trend": "up",   "label": "Total Customers",  "icon": "👥"},
    "total_products":   {"value": "145",          "change": "+4",      "trend": "up",   "label": "Products Listed",  "icon": "🔩"},
    "pending_orders":   {"value": "14",           "change": "-3",      "trend": "down", "label": "Pending Orders",   "icon": "⏳"},
    "low_stock":        {"value": "7",            "change": "+2",      "trend": "up",   "label": "Low Stock Alerts", "icon": "⚠️"},
    "refund_requests":  {"value": "3",            "change": "0",       "trend": "flat", "label": "Refund Requests",  "icon": "↩️"},
    "avg_order_value":  {"value": "₱5,118",       "change": "+3.2%",   "trend": "up",   "label": "Avg Order Value",  "icon": "📊"},
}
