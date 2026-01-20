# Robots.txt Update Implementation Guide
## Step-by-Step Instructions for Discourse Admin Panel

**Date:** January 20, 2026  
**Task:** Update robots.txt with aggressive junk blocking  
**Time Required:** 10-15 minutes  
**Risk Level:** LOW (reversible, backup created)  

---

## 📋 WHAT WAS CHANGED

### New Rules Added (Aggressive Blocking)

✅ **Tag Archives** - Blocks thin content tag lists  
✅ **Pagination** - Stops Google crawling duplicate paginated content  
✅ **Activity Feeds** - Blocks /latest, /top, /categories feeds  
✅ **Category List Views** - Blocks /c/*/l/ archive views  
✅ **JSON Endpoints** - Blocks all .json format requests  
✅ **User Notification Paths** - Blocks personal notification pages  
✅ **Additional Params** - Blocks api_username, source, u parameters  

### What Stayed the Same

✅ All existing profile blocks (no change)  
✅ All AI bot allowances (GPTBot, Claude, etc.)  
✅ All scraper bot blocks (no change)  
✅ All asset allowances (uploads, images, etc.)  

---

## 🚀 IMPLEMENTATION STEPS

### Step 1: Log into Discourse Admin (2 minutes)

1. Go to: **https://sanjal.com**
2. Log in with your admin account
3. Click your profile picture (top right)
4. Click **"Admin"** from dropdown menu

---

### Step 2: Navigate to robots.txt Editor (1 minute)

1. In the Admin panel, look at the left sidebar
2. Click: **"Customize"**
3. Click: **"robots.txt"**

OR use direct navigation:
- Look for: **⚙️ Settings** or **🎨 Customize** section
- Find: **robots.txt** option

**Alternative path if above doesn't work:**
- Admin → Settings → Search for "robots"
- Look for "robots.txt override" setting

---

### Step 3: Copy the New robots.txt Content (2 minutes)

1. Open the file: **`robots.txt-UPDATED-VERSION.txt`** (in your project folder)
2. Select ALL content (Ctrl+A or Cmd+A)
3. Copy (Ctrl+C or Cmd+C)

**The file is located at:**
```
/home/bazlur/projects/upwork/sanjal/robots.txt-UPDATED-VERSION.txt
```

---

### Step 4: Replace Content in Discourse (3 minutes)

1. In the robots.txt editor in Discourse admin:
   - **Select all existing content** (Ctrl+A / Cmd+A)
   - **Delete it**

2. **Paste the new content** (Ctrl+V / Cmd+V)

3. **Review the content** - make sure it looks complete:
   - Should start with: `# Sanjal.com Robots Configuration`
   - Should have sections for: Global Rules, AI Bots, Scrapers
   - Should end with: `# END OF ROBOTS.TXT`

4. **Click "Save"** button (usually at top or bottom of editor)

---

### Step 5: Verify It's Live (3 minutes)

**Test 1: View in Browser**
1. Open new tab
2. Go to: **https://sanjal.com/robots.txt**
3. Verify you see the new content
4. Look for the NEW sections (tag blocking, pagination, etc.)

**Test 2: Check Key Rules Exist**
Look for these lines in the live robots.txt:
```
✓ Disallow: /tag/
✓ Disallow: /*?page=*
✓ Disallow: /latest
✓ Disallow: /c/*/l/
```

If you see all 4, you're good! ✅

---

### Step 6: Test Blocking Works (5 minutes - OPTIONAL)

**Use Google's Robots.txt Tester:**

1. Go to: **https://search.google.com/test/robots-txt-tester**
2. Select your property: **sanjal.com**
3. The tool will load your live robots.txt automatically

**Test These URLs (should be BLOCKED):**

```
Test URL: https://sanjal.com/tag/cricket
Expected: ❌ BLOCKED

Test URL: https://sanjal.com/latest
Expected: ❌ BLOCKED

Test URL: https://sanjal.com/u/someuser
Expected: ❌ BLOCKED

Test URL: https://sanjal.com/t/topic/123?page=2
Expected: ❌ BLOCKED
```

**Test These URLs (should be ALLOWED):**

```
Test URL: https://sanjal.com/t/nepal-cricket/123
Expected: ✅ ALLOWED

Test URL: https://sanjal.com/c/nepal-sports
Expected: ✅ ALLOWED
```

If blocking/allowing works as expected, you're done! 🎉

---

## ⚠️ TROUBLESHOOTING

### Issue 1: Can't Find robots.txt Editor

**Symptom:** No "Customize" → "robots.txt" option

**Solution:**
1. Try: Admin → Settings
2. Search box: type "robots"
3. Look for setting called: "robots_txt" or "robots.txt override"
4. Paste content there instead

**Alternative:**
- Some Discourse versions put this under: Admin → Customize → Themes
- Or: Admin → Site Settings → Basic Setup

---

### Issue 2: Changes Don't Appear Live

**Symptom:** https://sanjal.com/robots.txt still shows old version

**Solution:**
1. Clear your browser cache (Ctrl+Shift+R / Cmd+Shift+R)
2. Try incognito/private browsing mode
3. Wait 5 minutes (some CDN caching)
4. Check Discourse logs for errors

---

### Issue 3: Accidental Deletion or Error

**Symptom:** Made a mistake, need to restore

**Solution:**
1. Your backup is saved at: **`robots.txt-CURRENT-BACKUP.txt`**
2. Open that file
3. Copy all content
4. Paste it back into Discourse admin
5. Save
6. You're back to the original!

---

## 📊 EXPECTED IMPACT (Timeline)

### Immediate (Today - Day 1)
```
✅ New robots.txt is live
✅ Google sees blocked URLs immediately on next crawl
⏳ Google Search Console won't show changes yet
```

### Days 2-7 (Week 1)
```
✅ Google stops crawling blocked URLs
⚠️ GSC may show spike in "Blocked by robots.txt" (normal)
⏳ Crawl requests will start decreasing
```

### Weeks 2-4
```
✅ More efficient crawling of quality content
✅ "Excluded by robots.txt" count increases in GSC
✅ Crawl budget focused on topic pages
⏳ Index changes take time
```

### Months 2-3
```
✅ Reduced "Crawled - not indexed" count
✅ Better indexing of quality pages
✅ Improved organic performance
```

---

## 📈 MONITORING CHECKLIST

### Today (Right After Update)
```
☐ Verify robots.txt live at https://sanjal.com/robots.txt
☐ Test with Google's robots.txt tester tool
☐ Screenshot current GSC metrics (baseline)
☐ Note today's date and time for tracking
```

### This Week (Daily Checks)
```
☐ Check GSC → Settings → Crawl Stats
☐ Monitor "Excluded by robots.txt" count
☐ Watch for any crawl errors
☐ Verify important pages still being crawled
```

### Next 4 Weeks (Weekly Checks)
```
☐ Review GSC indexing status report
☐ Check crawl efficiency improvements
☐ Monitor pages indexed count
☐ Track organic traffic changes
```

---

## ✅ SUCCESS CRITERIA

### You'll Know It's Working When:

**Week 1:**
```
✅ "Excluded by robots.txt" jumps to 500-800
✅ Crawl requests decrease by 20-30%
✅ Fewer errors on tag/pagination URLs
```

**Week 4:**
```
✅ Crawl budget focused on /t/ topic pages
✅ 10-20% reduction in "Crawled - not indexed"
✅ More topic pages in "Discovered" or "Crawled" status
```

**Week 8:**
```
✅ Improved organic click-through rates
✅ Better rankings for quality content
✅ Higher percentage of pages actually indexed
```

---

## 🔄 ROLLBACK PLAN (If Needed)

If something goes wrong and you need to revert:

1. **Open backup file:** `robots.txt-CURRENT-BACKUP.txt`
2. **Copy all content**
3. **Go to Discourse Admin → Customize → robots.txt**
4. **Paste the backup content**
5. **Save**
6. **Done** - you're back to original state

---

## 📞 SUPPORT RESOURCES

### If You Need Help

**Discourse Meta Forum:**
- URL: https://meta.discourse.org
- Category: #support
- Search: "robots.txt customization"

**Google Search Console Help:**
- URL: https://support.google.com/webmasters
- Topic: robots.txt testing and validation

**This Project's Documentation:**
- Detailed strategy: `05-aggressive-robots-noindex-strategy.md`
- Action plan: `02-week-by-week-action-plan.md`
- Analysis: `DAY1-SUMMARY-CONCLUSIONS.md`

---

## 📝 WHAT'S NEXT (After robots.txt Update)

### Immediate Next Steps (Day 2-3):

1. **Title Optimization** - Fix top 10-20 Nepal thread titles
   - "nepal vs uae" thread → better title
   - "mahabir pun" thread → better title
   - Expected impact: 0% CTR → 5-10% CTR

2. **Technical Errors** - Fix 14 pages with 404/5xx errors

### Week 2:

3. **Category Restructuring** - Create 3 new Nepal-focused categories
   - Nepal Cricket & Sports
   - Nepal Entertainment & Cinema
   - Nepal Technology & Digital

### Week 3-4:

4. **Content Migration** - Move content to new categories
5. **Monitor & Adjust** - Review GSC data, refine strategy

---

## ✅ COMPLETION CHECKLIST

**Before You Close This Guide:**

```
☐ robots.txt updated in Discourse admin
☐ Verified live at https://sanjal.com/robots.txt
☐ Tested with Google's robots.txt tester
☐ Backup saved (robots.txt-CURRENT-BACKUP.txt)
☐ Baseline GSC metrics recorded
☐ Calendar reminders set for weekly monitoring
☐ Know where rollback file is located
```

**Once all boxes checked, robots.txt update is COMPLETE!** ✅

---

## 🎯 SUMMARY

**What You Did:**
- Added aggressive blocking rules to robots.txt
- Blocked tags, pagination, activity feeds, and low-value pages
- Maintained AI bot access and asset availability

**Why It Matters:**
- Stops Google from wasting crawl budget on junk
- Forces focus on quality discussion threads
- Critical step in indexing improvement strategy

**Time Investment:**
- 10-15 minutes to implement
- 5 minutes daily monitoring for 1 week
- Long-term benefit: Better indexing and organic traffic

---

**Ready to implement? Follow Step 1 above to get started!**

**Date Implemented:** _______________ (fill in when complete)  
**Verified Live:** ☐ YES ☐ NO  
**Issues Encountered:** _______________ (none if all went well!)

---

*This guide is part of the Sanjal.com SEO project - Day 2 implementation*  
*For questions, refer to project documentation or Discourse Meta forum*
