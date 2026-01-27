# Discourse Theme Component Implementation Guide
**Creating "Sanjal Modern UI" Component**

## Step-by-Step Instructions

### **Step 1: Create New Component**

1. Go to: **Admin → Customize → Themes**
2. Click **"Install"** button (top right)
3. Click **"+ Create new"** 
4. Select **"Component"** from Type dropdown
5. Name: `Sanjal Modern UI`
6. Click **"Create"**

---

### **Step 2: Add CSS Code**

1. You'll see the component page
2. Look for **"Edit CSS/HTML"** button or link
3. Click it to open the editor
4. You should see tabs: **Common, Desktop, Mobile**
5. Stay on the **"Common"** tab (applies to all devices)
6. In the CSS editor, paste the code from `sanjal-modern-ui-component.css`
7. Click **"Save"**

---

### **Step 3: Attach Component to FKB Pro Theme**

1. Go back to: **Admin → Customize → Themes**
2. Click on **"FKB Pro theme"** (your active theme)
3. Scroll down to find **"Theme Components"** or **"Included Components"** section
4. Click **"Add"** or **"Include"**
5. Select **"Sanjal Modern UI"** from the list
6. Click **"Save"** or it may save automatically

---

### **Step 4: Preview & Test**

1. Open sanjal.com in a new browser tab
2. Refresh the page (Ctrl+F5 or Cmd+Shift+R)
3. You should see:
   - Modern typography
   - Card-based topic styling
   - Better spacing and colors
   - Cleaner overall look

---

### **Step 5: Iterate Based on Client Feedback**

**To Make Changes:**
1. Go to: **Admin → Customize → Themes**
2. Click **"Components"** tab at top
3. Find **"Sanjal Modern UI"**
4. Click **"Edit CSS/HTML"**
5. Modify CSS
6. Save and refresh site

**To Disable Temporarily:**
1. Go to FKB Pro theme settings
2. Remove "Sanjal Modern UI" from components
3. Site returns to FKB Pro default

---

## Troubleshooting

### **CSS Not Showing Up?**
- Clear browser cache and refresh
- Check component is attached to FKB Pro
- Make sure component is saved properly

### **Something Looks Broken?**
- Disable the component temporarily
- Check CSS for syntax errors
- Test on different browsers

### **Want to Make Adjustments?**
- Colors too bright? Change hex values in CSS
- Cards too big? Adjust padding values
- Font too small? Change font-size values

---

## CSS File Structure

The `sanjal-modern-ui-component.css` file includes:

1. **Typography** - Modern system fonts, sizes, line heights
2. **Layout** - Max widths, spacing, padding
3. **Topic Cards** - Card styling, shadows, hover effects
4. **Colors** - Clean color palette
5. **Mobile** - Responsive breakpoints
6. **Category Badges** - Colored category tags
7. **Headers** - Clean header styling

---

## What This Achieves

✅ Modern, clean aesthetic
✅ Better readability
✅ Card-based topic display
✅ Professional look
✅ Mobile-optimized
✅ Works with FKB Pro theme

---

## Important Notes

- **Safe**: Component doesn't modify FKB Pro - works alongside it
- **Reversible**: Can disable anytime without data loss
- **Update-proof**: Won't break when FKB Pro updates
- **Flexible**: Easy to adjust CSS based on feedback

---

**Need Help?** Check Discourse's component documentation or ask in Discourse Meta forums.
