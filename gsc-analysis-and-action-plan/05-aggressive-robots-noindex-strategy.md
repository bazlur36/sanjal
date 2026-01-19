# AGGRESSIVE ROBOTS.TXT & NOINDEX STRATEGY
## Blocking Junk Content from Google Index

**Last Updated:** January 19, 2026  
**Purpose:** Prevent Google from wasting crawl budget on low-value pages  
**Based on:** Client feedback emphasizing aggressive junk removal  
**Impact:** Forces Google to focus ONLY on high-quality discussion threads  

---

## 🎯 THE STRATEGY

### Core Principle
**"Google treats your entire domain based on what it sees first."**

If Google crawls thousands of:
- Profile pages (thin content)
- Tag archive pages (duplicate content)
- Pagination pages (duplicate content)
- Low-quality threads (1-2 word posts)

...it labels your entire domain as "thin UGC" (user-generated content) and won't index ANYTHING.

### Solution: Three-Tier Blocking
```
TIER 1: robots.txt - Block at crawl level
TIER 2: Noindex meta tags - Block at index level
TIER 3: Sitemap exclusion - Don't submit to Google
```

---

## 📋 CURRENT ROBOTS.TXT STATUS

### What's Already Blocked ✅
```
# User profiles (already blocked)
Disallow: /u/
Disallow: /users/
Disallow: /p/

# Admin & system pages (already blocked)
Disallow: /admin/
Disallow: /auth/
Disallow: /email/
Disallow: /session
Disallow: /my

# Search & utility pages (already blocked)
Disallow: /search
Disallow: /g
Disallow: /badges
Disallow: /groups/

# Duplicate views (already blocked)
Disallow: /*?print=
Disallow: /*?order=
Disallow: /*?status=
Disallow: /t/*/*.rss
Disallow: /c/*.rss
```

### What's Currently MISSING ❌
```
# Tag archives - NOT blocked yet
/tag/ - Thin content lists
/tags/ - Navigation pages
/tag/*/l/ - Tag list views

# Pagination - NOT blocked yet
?page= - Duplicate content
/*?*page=* - All pagination parameters

# Search results - Partially blocked
/search?q= - Could be more specific

# Activity feeds - NOT blocked
/latest - Duplicate of topics
/top - Duplicate of topics
/categories - Duplicate of category pages
```

---

## 🚀 ENHANCED ROBOTS.TXT (Client-Requested Aggressive Version)

### Complete Updated robots.txt

```robots
# ============================================================
# SANJAL.COM ROBOTS.TXT - AGGRESSIVE SEO OPTIMIZATION
# ============================================================
# Purpose: Block all junk, focus Google on quality discussions
# Updated: January 19, 2026
# ============================================================

# SITEMAP DECLARATION
# ============================================================
Sitemap: https://sanjal.com/sitemap.xml

# ============================================================
# GLOBAL RULES (All Bots)
# ============================================================
User-agent: *

# ADMIN & SYSTEM PAGES (Block completely)
# ============================================================
Disallow: /admin/
Disallow: /auth/
Disallow: /email/
Disallow: /session
Disallow: /my
Disallow: /u/
Disallow: /users/
Disallow: /user-api-key
Disallow: /p/

# SEARCH & UTILITY PAGES (Block completely)
# ============================================================
Disallow: /search
Disallow: /search?q=
Disallow: /g
Disallow: /badges
Disallow: /groups/

# TAG & CATEGORY NAVIGATION (Block archives, keep main pages)
# ============================================================
# Block tag archive pages (thin content)
Disallow: /tag/
Disallow: /tags/
Disallow: /tag/*/l/
Disallow: /tags/*/l/

# Block category list views (keep main category page)
Disallow: /c/*/l/
Disallow: /c/*/l/latest
Disallow: /c/*/l/top

# ACTIVITY FEEDS (Block - duplicate content)
# ============================================================
Disallow: /latest
Disallow: /latest.json
Disallow: /top
Disallow: /top.json
Disallow: /categories
Disallow: /categories.json
Disallow: /unread
Disallow: /new

# PAGINATION (Block all - duplicate content)
# ============================================================
# Block all pagination parameters
Disallow: /*?page=*
Disallow: /*&page=*
Disallow: /*?*page=*
Disallow: /t/*?page=*
Disallow: /c/*?page=*

# DUPLICATE VIEWS & FORMATS (Block completely)
# ============================================================
Disallow: /*?print=
Disallow: /*?order=
Disallow: /*?status=
Disallow: /*?ascending=
Disallow: /*?descending=
Disallow: /t/*/*.rss
Disallow: /c/*.rss
Disallow: /*.json
Disallow: /*.json?*

# TRACKING & API PARAMETERS (Block completely)
# ============================================================
Disallow: /*?api_key*
Disallow: /*?api_username*
Disallow: /*?utm_*
Disallow: /*?ref=*
Disallow: /*?source=*
Disallow: /*?u=*

# USER NOTIFICATIONS & PERSONAL VIEWS (Block completely)
# ============================================================
Disallow: /notifications
Disallow: /my/*
Disallow: /u/*/summary
Disallow: /u/*/activity
Disallow: /u/*/notifications
Disallow: /u/*/messages
Disallow: /u/*/preferences

# EXPLICIT ALLOWS (Ensure these CAN be crawled)
# ============================================================
Allow: /uploads/
Allow: /stylesheets/
Allow: /images/
Allow: /assets/

# Only allow main topic pages: /t/topic-slug/id
# Only allow main category pages: /c/category-slug

# ============================================================
# AI BOTS (Welcome for brand visibility)
# ============================================================

User-agent: GPTBot
Allow: /

User-agent: CCBot
Allow: /

User-agent: Google-Extended
Allow: /

User-agent: ClaudeBot
Allow: /

User-agent: anthropic-ai
Allow: /

User-agent: PerplexityBot
Allow: /

User-agent: Applebot-Extended
Allow: /

# ============================================================
# SEO SCRAPER BOTS (Block completely - waste bandwidth)
# ============================================================

User-agent: mauibot
Disallow: /

User-agent: semrushbot
Disallow: /

User-agent: ahrefsbot
Disallow: /

User-agent: blexbot
Disallow: /

User-agent: seo spider
Disallow: /

User-agent: MJ12bot
Disallow: /

User-agent: DotBot
Disallow: /

# ============================================================
# END OF ROBOTS.TXT
# ============================================================
```

---

## 🔧 IMPLEMENTATION STEPS

### Step 1: Update robots.txt (Day 1)
**Time:** 15 minutes

**In Discourse Admin:**
```
1. Go to: Admin → Customize → robots.txt
2. Replace entire contents with the new version above
3. Click "Save"
4. Verify at: https://sanjal.com/robots.txt
```

**Verification:**
```
1. Visit https://sanjal.com/robots.txt in browser
2. Confirm new rules are live
3. Test with Google's robots.txt Tester:
   https://search.google.com/test/robots-txt-tester
```

### Step 2: Test Blocked URLs (Day 1)
**Time:** 30 minutes

**URLs to Test (should be blocked):**
```
❌ https://sanjal.com/u/username - Should be blocked
❌ https://sanjal.com/tag/example - Should be blocked
❌ https://sanjal.com/latest - Should be blocked
❌ https://sanjal.com/t/example/123?page=2 - Should be blocked
```

**URLs to Test (should be ALLOWED):**
```
✅ https://sanjal.com/t/topic-title/123 - Should be allowed
✅ https://sanjal.com/c/category-name - Should be allowed
✅ https://sanjal.com/uploads/image.jpg - Should be allowed
```

### Step 3: Monitor GSC Response (Week 1-2)
**Time:** 5 min daily

**Expected Changes:**
```
Week 1-2:
☐ Crawl requests decrease (Google stops wasting time on junk)
☐ Crawl errors may spike temporarily (Google hits blocked URLs)
☐ "Excluded by robots.txt" count increases

Week 3-4:
☐ Crawl focus shifts to allowed pages
☐ More efficient crawling of quality content
☐ Better indexing of topic pages
```

---

## 🎯 TIER 2: AGGRESSIVE NOINDEXING

### Target: Low-Quality Threads

**Criteria for Noindexing:**
```
☐ 0-2 replies (no meaningful discussion)
☐ < 20 total views (no interest)
☐ Opening post < 50 words (too thin)
☐ Spam or off-topic
☐ Duplicate of better thread
☐ Outdated information that can't be updated
```

### Method 1: Move to Noindex Category
**Time:** 2 hours setup + ongoing

**Setup:**
```
1. Admin → Categories → New Category
2. Name: "Low Value Archive" (or similar)
3. Settings:
   ☐ Show category on homepage: ✗ unchecked
   ☐ Include in search: ✗ unchecked
   ☐ Suppress from latest: ✓ checked
   ☐ Visible to: Staff only (optional)
4. Save category
```

**Add to robots.txt:**
```
# Block archived low-value category
Disallow: /c/low-value-archive/
```

**Bulk Move Process:**
```
1. Identify 300-500 lowest quality threads
2. Select multiple topics (checkboxes)
3. Bulk Actions → Move to Category
4. Select "Low Value Archive"
5. Move all at once
```

### Method 2: Close + Unlist Topics
**Time:** 1 hour

**Discourse Bulk Actions:**
```
1. Select low-quality topics
2. Bulk Actions → Close Topics
3. Bulk Actions → Unlist Topics

Effect:
- Closed = No new replies
- Unlisted = Removed from topic lists
- Still accessible via direct URL
- Less likely to be crawled/indexed
```

### Method 3: Direct Noindex (Requires Plugin/Theme)
**Time:** Varies

**If Available:**
```
Some Discourse themes/plugins allow per-category noindex
Check: Admin → Themes → [Your Theme] → Settings
Look for: "Add noindex meta tag"
```

---

## 📊 TIER 3: SITEMAP OPTIMIZATION

### Current Sitemap Status
Your sitemap at `https://sanjal.com/sitemap.xml` currently includes:
```
✅ Topic pages (/t/*) - KEEP
✅ Category pages (/c/*) - KEEP
⚠️ Tag pages (/tag/*) - CONSIDER REMOVING
⚠️ User profiles (/u/*) - Already in robots.txt, will be ignored
```

### Sitemap Configuration
**Time:** 15 minutes

**In Discourse Admin:**
```
1. Go to: Admin → Settings
2. Search: "sitemap"
3. Review settings:

   enable_sitemap: ✓ checked
   sitemap_refresh_interval: 1 (daily)
   sitemap_page_size: 50000 (default)
   
4. Ensure only quality content is included
```

**What Discourse Includes by Default:**
```
Discourse automatically excludes from sitemap:
✓ Private categories
✓ Unlisted topics
✓ Closed + unlisted topics
✓ Deleted topics
✓ User profiles (usually)

Verify your sitemap at: https://sanjal.com/sitemap.xml
```

---

## 🔍 MONITORING & VALIDATION

### Week 1 Checklist
**Daily Monitoring:**
```
☐ Check GSC → Settings → Crawl Stats
  - Crawl requests should decrease
  - Pages crawled per day should focus on quality

☐ Check GSC → Indexing → Pages
  - "Excluded by robots.txt" should increase
  - "Crawled - not indexed" should eventually decrease

☐ Verify robots.txt is live: sanjal.com/robots.txt
```

### Week 2-4 Checklist
**Weekly Monitoring:**
```
☐ GSC pages indexed count
☐ Crawl efficiency (pages crawled vs pages indexed)
☐ Check for crawl errors
☐ Verify important pages ARE being crawled
```

### Validation Tools

**1. Google Search Console Robots.txt Tester**
```
URL: https://search.google.com/test/robots-txt-tester
Steps:
1. Enter sanjal.com as property
2. Paste robots.txt content
3. Test specific URLs
4. Verify blocked/allowed status
```

**2. Google URL Inspection Tool**
```
GSC → URL Inspection
Test specific URLs:
- Should see "Blocked by robots.txt" for unwanted pages
- Should see "URL is on Google" for quality pages
```

**3. Site: Search Operator**
```
In Google search:
site:sanjal.com /u/
→ Should show decreasing results over time

site:sanjal.com /t/
→ Should show your actual discussion topics
```

---

## ⚠️ EXPECTED IMPACTS & TIMELINE

### Immediate (Days 1-7)
```
✅ robots.txt blocks take effect instantly
✅ Google stops crawling blocked URLs
⚠️ GSC may show spike in crawl errors (normal - Google testing blocks)
⚠️ "Excluded by robots.txt" count increases
```

### Short-term (Weeks 2-4)
```
✅ More efficient crawling of allowed pages
✅ Crawl budget focused on quality content
✅ Previously blocked pages drop from index
⏳ Quality pages get re-crawled more frequently
```

### Medium-term (Months 2-3)
```
✅ "Crawled - not indexed" count decreases
✅ More quality pages getting indexed
✅ Better domain authority perception
✅ Improved rankings for indexed pages
```

### Long-term (Months 4-6)
```
✅ Steady stream of new indexing
✅ Better organic traffic
✅ Higher quality backlink profile
✅ Improved user engagement metrics
```

---

## 🚨 TROUBLESHOOTING

### Issue 1: Important Pages Blocked
**Symptoms:** Quality content not appearing in search

**Solution:**
```
1. Check robots.txt for overly broad rules
2. Use URL Inspection in GSC
3. Add specific Allow: rule if needed
4. Request re-crawl via GSC
```

### Issue 2: Blocked URLs Still Showing in Google
**Symptoms:** Profile/tag pages still in search results

**Solution:**
```
Normal - Takes 2-4 weeks to fully remove
Speed up:
1. GSC → Removals → Temporary removals
2. Submit blocked URLs for removal
3. Wait for Google to process
```

### Issue 3: Crawl Rate Drops Too Much
**Symptoms:** Google barely crawling site

**Solution:**
```
1. Check GSC Crawl Stats
2. May be temporary adjustment period
3. If persists 2+ weeks, review robots.txt rules
4. Consider less aggressive blocking
```

### Issue 4: Discourse Updates Override robots.txt
**Symptoms:** Custom rules disappear after update

**Solution:**
```
1. Save robots.txt content as backup file
2. After Discourse updates, verify robots.txt
3. Re-apply custom rules if needed
4. Consider theme-level customization for persistence
```

---

## 💡 ADVANCED TACTICS

### Tactic 1: Progressive Blocking
**Approach:** Start conservative, increase gradually

```
Week 1: Block profiles, admin, search
Week 2: Block tag archives
Week 3: Block pagination
Week 4: Block activity feeds

Monitor GSC impact between each change
```

### Tactic 2: Quality Threshold Enforcement
**Approach:** Only allow topics meeting criteria in sitemap

```
Criteria for sitemap inclusion:
☐ 3+ replies minimum
☐ 50+ views minimum
☐ Opening post 100+ words
☐ Not closed/unlisted
☐ Category is public and searchable
```

**Implementation:**
```
This requires custom Discourse plugin or manual sitemap
Review: Discourse Meta for "sitemap filtering plugins"
Alternative: Use noindex category for low-quality threads
```

### Tactic 3: Crawl Delay (Use with Caution)
**Approach:** Slow down aggressive crawlers

```
User-agent: *
Crawl-delay: 1

Note: Google ignores Crawl-delay
Use only if bandwidth is issue with other bots
```

---

## 📋 IMPLEMENTATION CHECKLIST

### Pre-Implementation (Day 0)
```
☐ Backup current robots.txt
☐ Backup Discourse settings
☐ Document current GSC metrics
☐ Create monitoring spreadsheet
```

### Day 1: Deploy New robots.txt
```
☐ Update robots.txt with aggressive rules
☐ Verify live at sanjal.com/robots.txt
☐ Test with GSC robots.txt tester
☐ Test sample blocked/allowed URLs
☐ Screenshot GSC metrics (baseline)
```

### Day 2-3: Identify Low-Quality Content
```
☐ Create "Low Value Archive" category
☐ Audit 4,373 topics for quality
☐ Identify 300-500 worst offenders
☐ Document topic IDs for bulk action
```

### Day 4-5: Bulk Noindexing
```
☐ Move 300-500 low-quality topics to archive category
☐ Or: Close + unlist low-quality topics
☐ Verify they're not in sitemap
☐ Update tracking spreadsheet
```

### Day 6-7: Verification
```
☐ Check sitemap for cleanliness
☐ Verify robots.txt still correct
☐ Review GSC for changes
☐ Test random URLs for proper blocking
```

### Week 2-4: Monitor & Adjust
```
☐ Daily: Check GSC crawl stats
☐ Weekly: Review indexing changes
☐ Adjust strategy based on results
☐ Document learnings
```

---

## 🎯 SUCCESS METRICS

### Track These Weekly

**Google Search Console:**
```
Metric                          | Baseline | Target (4 weeks)
--------------------------------|----------|------------------
Crawled pages per day           | ___      | ↓ 30-50%
"Excluded by robots.txt"        | 22       | ↑ 500-800
"Crawled - not indexed"         | 4,839    | ↓ 10-20%
Pages indexed                   | ~160     | ↑ 200-300
```

**Quality Indicators:**
```
☐ Higher % of crawls on actual topic pages
☐ Fewer crawl errors on junk pages
☐ Better crawl efficiency ratio
☐ More topic pages in "URL is on Google" status
```

---

## 🚀 QUICK REFERENCE

### What Gets BLOCKED (Summary)
```
❌ User profiles (/u/, /users/, /p/)
❌ Tag archives (/tag/, /tags/)
❌ Pagination (?page=, &page=)
❌ Activity feeds (/latest, /top, /categories)
❌ Search pages (/search)
❌ Admin areas (/admin/, /my/)
❌ Duplicate formats (.json, .rss, ?print=)
❌ Tracking parameters (utm_*, ?ref=)
❌ Personal views (/notifications, /messages)
```

### What Gets ALLOWED (Summary)
```
✅ Topic pages (/t/topic-slug/id)
✅ Category pages (/c/category-slug)
✅ Uploads (/uploads/)
✅ Assets (/stylesheets/, /images/)
✅ High-quality discussions (3+ replies, good content)
```

---

## 📞 SUPPORT & RESOURCES

### If You Need Help

**Discourse Meta Forum:**
```
URL: meta.discourse.org
Search for: "robots.txt SEO"
Post in: #support or #seo-and-performance
```

**Google Search Central:**
```
URL: developers.google.com/search
Focus on: robots.txt documentation
Read: Webmaster guidelines
```

**Test & Validation Tools:**
```
- GSC robots.txt tester
- GSC URL Inspection
- Technical SEO Chrome extensions
```

---

## ✅ FINAL CHECKLIST

**Before Proceeding:**
```
☑ Understood the three-tier blocking strategy
☑ Backed up current robots.txt
☑ Ready to monitor GSC daily for 1 week
☑ Identified 300-500 low-quality threads
☑ Created noindex category (or have plan to)
☑ Have realistic expectations (4-12 week timeline)
```

**You're ready to implement when all boxes are checked!**

---

**Next Steps:**
1. Copy the new robots.txt from this document
2. Implement in Discourse admin
3. Proceed with Week 1 Day 1 tasks from the action plan
4. Monitor GSC closely for impacts

---

*Document: 5 of 5*  
*Status: Aggressive Robots.txt & Noindex Strategy*  
*Part of: GSC Analysis & Action Plan*
