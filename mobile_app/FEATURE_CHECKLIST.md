# Wedzz Mobile App - Feature Checklist

## How to Get the Latest Build

1. **Wait for GitHub Actions to complete** (check the Actions tab on GitHub)
2. **Download the new APK** from the latest workflow run
3. **Install the new APK** on your device (it should update the existing app now that signing is configured)

## Features to Test - All Should Work!

### ✅ Product Detail Screen

**Location**: When you tap on any product card

**What to check**:
1. **Top Right Corner** - You should see TWO circular buttons:
   - ❤️ **Favorite Button** (heart icon)
   - 🛒 **Cart Button** (shopping cart icon with badge showing item count)
   
2. **Favorite Button**:
   - Tap it → Heart turns RED and filled
   - Shows "Added to favorites" message
   - Tap again → Heart becomes outline again
   - Shows "Removed from favorites" message
   
3. **Cart Button**:
   - Shows item count badge when cart has items
   - Tap it → Goes back to main screen where you can navigate to cart
   
4. **Images**:
   - Product image should load and display
   - If image fails, shows a placeholder icon
   - Shows loading spinner while image loads
   
5. **Add to Cart Button** (bottom):
   - Tap + and - to change quantity
   - Tap "Add to Cart" button
   - Shows "Added X items to cart" message

### ✅ Home Screen & Shop Screen

**What to check**:
1. **Product Cards**:
   - All cards are **CLICKABLE** - tap anywhere to view product details
   - Each card has a **heart icon** (bottom right of image)
   - Tap heart → Adds to favorites (turns red)
   - Tap again → Removes from favorites
   - Shows confirmation message

2. **Top Right Cart Button**:
   - Shopping cart icon with badge
   - Shows number of items in cart
   - Tap to navigate to cart screen

3. **Images**:
   - All product images load properly
   - Shows loading spinner if slow
   - Shows placeholder icon if image fails

### ✅ Profile Screen

**What to check - ALL buttons should respond**:

1. **Stats Cards**:
   - "Wishlist" number should update when you favorite products
   
2. **Account Section**:
   - Personal Information → Opens dialog
   - Addresses → Opens dialog
   - Payment Methods → Opens dialog

3. **Orders & Activity**:
   - Order History → Opens dialog
   - **Wishlist** → Shows your favorites count
   - Reviews → Opens dialog

4. **Settings**:
   - Notifications → Opens dialog
   - Security → Opens dialog
   - Language → Opens dialog
   - Theme → Opens dialog

5. **Support**:
   - **Customer Chat** → Opens chat screen ✅
   - Help Center → Opens dialog
   - Feedback → Opens dialog
   - **About** → Shows app version (1.0.0+2) ✅

6. **Logout Button**:
   - Shows confirmation dialog
   - Tap "Logout" → Shows success message

### ✅ Cart Screen

**What to check**:
1. **Product Images**: Should display properly
2. **Quantity Controls**: + and - buttons work
3. **Remove Button**: Trash icon removes item
4. **Total Price**: Updates correctly in Philippine Pesos (₱)

### ✅ Chat Screen

**What to check**:
1. Opens from Profile → Customer Chat
2. Opens from floating chat button (bottom right of home)
3. Can send messages
4. Auto-replies for common questions

## Common Issues & Solutions

### Issue: "I don't see the cart button on product detail screen"

**Solution**: You're using an OLD APK. Download the new one from GitHub Actions.

### Issue: "Favorite button doesn't work / doesn't turn red"

**Solution**: You're using an OLD APK. The new APK has full favorites functionality.

### Issue: "Images not loading"

**Solution**: 
1. Check your internet connection
2. The new APK has better image handling with error fallbacks
3. Some mock product images might have broken URLs - this is normal for demo data

### Issue: "Profile buttons don't do anything"

**Solution**: You're using an OLD APK. The new APK has all buttons working.

### Issue: "Package conflict when installing"

**Solution**: This happens when you try to install over an app signed with a different key.
- **Option 1** (RECOMMENDED): Uninstall the old app first, then install the new one
- **Option 2**: After this first update, all future updates will work seamlessly!

## Version Information

**Current Version**: 1.0.0+2
**Package Name**: com.wedzz.mobile
**Signed**: Yes (with consistent keystore)

## Build Status

Check the latest build here: https://github.com/djcalida/Weedz/actions

Look for the "Build Flutter APK" workflow. When it shows a green checkmark ✅, download the APK artifact.

## Still Having Issues?

If you've installed the LATEST APK from GitHub Actions and still see issues:

1. Check the build completed successfully (green checkmark on GitHub Actions)
2. Make sure you downloaded the RELEASE APK (not debug)
3. Try uninstalling completely and reinstalling
4. Clear app data: Settings → Apps → Wedzz → Clear Data
5. Provide a screenshot of the issue so I can see exactly what's happening

## What Was Fixed in Latest Build

1. ✅ Added shopping cart button to product detail screen (top right)
2. ✅ Made favorite button functional everywhere (product cards, product detail)
3. ✅ Made all profile section buttons functional (show dialogs or navigate)
4. ✅ Fixed image loading with error handling and loading indicators
5. ✅ Initialize favorites and cart on app startup (saved data loads correctly)
6. ✅ Product cards are fully clickable
7. ✅ Real-time favorites count in profile stats
8. ✅ Philippine Peso currency throughout
9. ✅ Chat feature working
10. ✅ Proper app signing for seamless updates
