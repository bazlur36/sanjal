# Database Backup Guide - Before Topic Migration
## Sanjal.com Discourse Forum

**Date:** January 26, 2026  
**Purpose:** Create backup before migrating 30-60 topics to Nepal subcategories  
**Priority:** CRITICAL - Must complete before any migration  

---

## 🛡️ WHY BACKUP BEFORE MIGRATION?

**What you're about to do:**
- Move 30-60 existing topics to new Nepal subcategories
- Change category assignments for multiple threads
- Potentially affect internal linking and topic organization

**What could go wrong:**
- Topics moved to wrong categories
- Broken internal links
- User confusion about reorganization
- Need to track what was categorized where before

**Solution:**
✅ Create full backup BEFORE migration  
✅ Document topic movements  
✅ Have ability to restore if needed  

---

## 📋 RECOMMENDED BACKUP METHOD

### **Method 1: Discourse Admin Backup (EASIEST - RECOMMENDED)**

**Advantages:**
- ✅ One-click backup from admin panel
- ✅ Complete forum snapshot (database + uploads)
- ✅ Easy one-click restore if needed
- ✅ No server access required
- ✅ Native Discourse feature

**Time Required:** 5-15 minutes (depending on database size)

---

## 🔧 STEP-BY-STEP: CREATE BACKUP

### **Step 1: Access Backup Interface**

1. **Log into sanjal.com** as admin
2. Click your **profile picture** (top right)
3. Select **"Admin"** from dropdown
4. In admin panel left sidebar, scroll down to **"Backups"**
5. Click **"Backups"**

---

### **Step 2: Create New Backup**

1. On Backups page, you'll see:
   - List of existing backups (if any)
   - **"Backup"** button (top right)
   
2. Click **"Backup"** button

3. A dialog appears asking to confirm:
   - ✓ "Create backup"
   - Options: Include uploads (recommended: YES)

4. Click **"OK"** or **"Create Backup"**

5. **Backup process starts:**
   - Status shows: "Backup in progress..."
   - Progress bar updates
   - Wait 5-15 minutes (don't close browser)

6. **When complete:**
   - Status: "Backup complete"
   - New backup file appears in list
   - Filename format: `sanjal-2026-01-26-123456-v20250126123456.tar.gz`

---

### **Step 3: Download Backup File**

1. In backup list, find your newly created backup
2. Click the **download icon** (↓) next to the backup
3. Save to your local machine

**Recommended filename:**
```
sanjal-backup-before-migration-jan26-2026.tar.gz
```

4. **Verify download:**
   - Check file size (should be 10MB - 500MB depending on forum size)
   - Confirm download completed successfully
   - Note the exact filename and size

---

### **Step 4: Store Backup Safely**

**Save backup in multiple locations:**
1. **Local computer:** Desktop or Documents folder
2. **Cloud storage:** Google Drive, Dropbox, or OneDrive
3. **External drive:** USB or external hard drive (best practice)

**Label with details:**
```
Filename: sanjal-backup-before-migration-jan26-2026.tar.gz
Date: January 26, 2026
Size: [actual file size]
Purpose: Pre-migration backup before moving 30-60 topics to Nepal subcategories
```

**Keep for:** At least 30 days after successful migration

---

## 🔄 HOW TO RESTORE BACKUP (IF NEEDED)

### **If Something Goes Wrong During Migration:**

1. **Go to Admin → Backups**
2. **If backup is still on server:**
   - Find your backup in the list
   - Click **"Restore"** button
   - Confirm restoration
   - Wait 10-20 minutes
   - Forum returns to exact state before migration

3. **If you need to upload backup:**
   - Click **"Upload"** button
   - Select your downloaded `.tar.gz` file
   - Wait for upload to complete
   - Then click **"Restore"**

**Important:**
- Forum goes into maintenance mode during restore
- All users temporarily locked out (10-20 min)
- Everything reverts to backup snapshot
- Any changes after backup are lost

---

## 📝 BACKUP VERIFICATION CHECKLIST

Before proceeding with migration, confirm:

```
☐ Backup created successfully in Discourse admin
☐ Backup file downloaded to local computer
☐ File size verified (not 0 bytes or corrupted)  
☐ Backup saved in 2-3 locations (local + cloud + external)
☐ Backup filename labeled with date and purpose
☐ Tested backup appears in Discourse backup list
☐ Noted backup filename: ________________________
☐ Noted backup size: ________________________
☐ Noted backup date/time: ________________________
```

**✅ All boxes checked? You're ready to proceed with topic migration!**

---

## 🎯 ALTERNATIVE BACKUP METHODS

### **Method 2: PostgreSQL Database Backup (Advanced)**

**If you have server SSH access:**

```bash
# Login to server
ssh user@sanjal.com

# Become discourse user
sudo -u discourse bash

# Go to Discourse directory
cd /var/discourse

# Create PostgreSQL backup
./launcher enter app
pg_dump discourse_production > /shared/backups/sanjal_backup_jan26_2026.sql

# Or with compression
pg_dump discourse_production | gzip > /shared/backups/sanjal_backup_jan26_2026.sql.gz

# Exit container
exit

# Download from server to local
scp user@sanjal.com:/var/discourse/shared/standalone/backups/sanjal_backup_jan26_2026.sql.gz ./
```

**Advantages:**
- More technical control
- Faster for very large databases
- Can be automated via cron

**Disadvantages:**
- Requires server access
- More technical knowledge needed
- Doesn't include uploads/attachments by default

---

### **Method 3: Manual Category Data Export (Lightweight)**

**Create a reference spreadsheet before migration:**

| Topic ID | Topic Title | Current Category | Target Category | Topic URL |
|----------|-------------|------------------|-----------------|-----------|
| 1234 | Nepal vs UAE Cricket | General | Nepal Cricket & Sports | https://sanjal.com/t/1234 |
| 1235 | Jerry on Top Review | Entertainment | Nepal Entertainment | https://sanjal.com/t/1235 |
| ... | ... | ... | ... | ... |

**How to create:**
1. Go through topics you plan to migrate
2. Document current state in spreadsheet
3. Use as reference during and after migration

**Advantages:**
- Simple and lightweight
- Easy to track what moved where
- Good for reporting to client

**Disadvantages:**
- Manual process
- Doesn't allow full restoration
- Only tracks category changes

---

## 💡 BEST PRACTICES

### **Before Migration:**
```
✅ Create Discourse backup (Method 1)
✅ Download backup file locally
✅ Verify file isn't corrupted
✅ Store in multiple locations
✅ Create migration tracking spreadsheet (Method 3)
```

### **During Migration:**
```
✅ Test with 3-5 topics first
✅ Verify small batch worked correctly
✅ Then proceed with bulk migration
✅ Document each batch moved
```

### **After Migration:**
```
✅ Keep backup for 30 days
✅ Monitor for issues (broken links, user confusion)
✅ If no problems after 30 days, can delete backup
✅ Create new backup before next major change
```

---

## 🚨 WHEN TO RESTORE FROM BACKUP

**Restore if:**
- ❌ Too many topics moved to wrong categories
- ❌ Major internal links broken
- ❌ Database corruption or errors
- ❌ User data accidentally deleted
- ❌ Forum behaving unexpectedly after migration

**Don't restore if:**
- ✅ Just 1-2 topics in wrong category (easier to move them back)
- ✅ Minor cosmetic issues
- ✅ Migration successful but want different organization (re-migrate instead)

---

## 📊 BACKUP SUCCESS METRICS

### **You know backup is successful when:**

```
✅ Backup file exists on local computer
✅ File size is reasonable (10MB - 500MB+)
✅ Backup appears in Discourse admin backup list
✅ Can click "Restore" button (don't actually restore, just verify button exists)
✅ Backup includes uploads (check backup settings)
✅ Backup filename clearly labeled
```

---

## 🎬 RECOMMENDED WORKFLOW

### **Complete Backup → Migration Process:**

**Phase 1: Backup (15 minutes)**
1. Create Discourse backup via admin panel
2. Download backup to local computer
3. Verify download successful
4. Save in 2-3 locations
5. ✅ Backup complete

**Phase 2: Small Test (15 minutes)**
6. Identify 3-5 Nepal cricket topics
7. Move to "Nepal Cricket & Sports" subcategory
8. Verify they appear correctly
9. Check for any issues
10. ✅ Test successful

**Phase 3: Bulk Migration (1-2 hours)**
11. Identify 30-60 Nepal topics across all 3 categories
12. Use bulk actions to move in batches
13. Document each batch moved
14. ✅ Migration complete

**Phase 4: Verification (15 minutes)**
15. Check all topics in correct categories
16. Verify no broken links
17. Take screenshots (before/after)
18. ✅ Migration verified

**Phase 5: Backup Retention (30 days)**
19. Keep backup safe for 30 days
20. Monitor forum for issues
21. Delete backup after 30 days if no problems
22. ✅ Project complete

---

## 📞 TROUBLESHOOTING

### **Problem: Backup button doesn't appear**
**Solution:**
- Check you're logged in as admin (not moderator)
- Try different browser
- Check Discourse version (backups available in most versions)

### **Problem: Backup fails or times out**
**Solution:**
- Check server disk space
- Try again during low-traffic time
- Contact hosting provider if persistent

### **Problem: Backup file won't download**
**Solution:**
- Check browser download settings
- Try right-click → "Save link as..."
- Check available local disk space

### **Problem: Want to test restore without affecting live forum**
**Solution:**
- Discourse backups are atomic - test on staging environment if available
- Or trust the backup (it's a standard feature, very reliable)
- Document backup exists but don't test restore on production

---

## ✅ READY TO PROCEED?

**Backup checklist completed:**
```
☐ Understand why backup is important
☐ Know how to create Discourse backup
☐ Know where to store backup file
☐ Know how to restore if needed
☐ Created migration tracking spreadsheet
☐ Ready to start migration process
```

**Next step:**
→ Create backup  
→ Then proceed to topic migration (see TOPIC-MIGRATION-LOG-TEMPLATE.md)

---

**File:** DATABASE-BACKUP-GUIDE.md  
**Created:** January 26, 2026  
**Purpose:** Backup strategy before topic migration  
**Status:** Ready for implementation
