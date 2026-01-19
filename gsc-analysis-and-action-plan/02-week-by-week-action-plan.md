# WEEK-BY-WEEK ACTION PLAN
## Admin-Focused Implementation Guide for Sanjal.com

**Duration:** First 4 Weeks  
**Goal:** Fix technical errors + Improve first 100-150 pages  
**Expected Results:** 200-300 newly indexed pages

---

## 📅 WEEK 1: AGGRESSIVE OPTIMIZATION & FOUNDATION
**Focus:** Intent mapping + Aggressive robots.txt + Title control + Technical fixes  
**Updated:** January 19, 2026 - Incorporates client feedback on aggressive SEO

---

### 🎯 WEEK 1 OVERVIEW (Revised Priorities)

**Based on client research and feedback, Week 1 now prioritizes:**
1. **Category Intent Mapping** (Day 1) - Align categories with real search queries
2. **Aggressive robots.txt** (Day 1-2) - Block all junk immediately
3. **Title Emergency Audit** (Day 2-3) - Fix worst titles first
4. **Technical Error Fixes** (Day 3-4) - Resolve 404s and 5xx errors
5. **Aggressive Noindexing** (Day 5-7) - Remove 300-500 lowest quality pages

**Key Documents to Reference:**
- `04-category-intent-mapping-guide.md` - Category optimization
- `05-aggressive-robots-noindex-strategy.md` - Blocking strategy

---

### DAY 1: CATEGORY INTENT MAPPING (NEW PRIORITY)

#### Task 1: Research Actual Search Queries
**Time Required:** 1-2 hours  
**Why First:** Categories must match search intent or nothing else matters

**Step-by-Step:**
1. Open **Google Search Console**
2. Go to: **Performance → Queries**
3. Export queries (last 3 months)
4. Identify top search patterns:
   ```
   ☐ What are users actually searching for?
   ☐ What keywords appear most?
   ☐ What locations are mentioned?
   ☐ What questions are asked?
   ```

5. **Use Google Autocomplete Research:**
   ```
   Type in Google:
   - "nepal [your main topics]"
   - "[your niche] how to"
   - "[your niche] best"
   
   Document all autocomplete suggestions
   ```

6. **Create Search Query Spreadsheet:**
   ```
   Search Query | Monthly Volume | Current Category | Should Be In
   ```

**Deliverable:** List of 20-30 actual search queries your content should target

#### Task 2: Audit Current Categories Against Search Intent
**Time Required:** 1 hour

**For EACH category on your forum:**
1. List current category name and description
2. Check if it matches any search queries from Task 1
3. Rate alignment:
   ```
   ✅ Perfect - Category name includes search keywords
   🟡 Good - Relevant but name could improve  
   🟠 Fair - Too broad or vague
   ❌ Poor - Doesn't match any search queries
   ```

**Use Category Intent Mapping Worksheet:**
```
See: 04-category-intent-mapping-guide.md
Complete worksheet for each major category
```

#### Task 3: Plan Category Restructuring
**Time Required:** 30 minutes

**Identify Actions Needed:**
```
RENAME: Categories with poor search alignment
→ "General Discussion" → "Nepal Current Affairs & News"

MERGE: Duplicate or similar categories
→ Combine 3 travel categories → "Nepal Travel & Trekking"

SPLIT: Overly broad categories
→ "Sports" → "Nepal Cricket News" + "Nepal Football Updates"

DELETE: Unused or spam categories
→ Archive if < 10 topics and no value
```

**Deliverable:** Category restructuring plan for implementation in Week 2

---

### DAY 1-2: IMPLEMENT AGGRESSIVE ROBOTS.TXT

#### Task 1: Backup Current Configuration
**Time Required:** 10 minutes

**Backup Steps:**
1. Visit: https://sanjal.com/robots.txt
2. Copy entire contents
3. Save to file: `robots-txt-backup-2026-01-19.txt`
4. Also screenshot current GSC metrics as baseline

#### Task 2: Deploy Enhanced robots.txt
**Time Required:** 30 minutes

**In Discourse Admin:**
```
1. Go to: Admin → Customize → robots.txt
2. Replace entire contents with aggressive version from:
   05-aggressive-robots-noindex-strategy.md
3. Click "Save"
4. Verify live at: https://sanjal.com/robots.txt
```

**New Blocking Includes:**
```
✅ Tag archives (/tag/, /tags/, /tag/*/l/)
✅ Pagination (/*?page=*, /*&page=*, /t/*?page=*)
✅ Activity feeds (/latest, /top, /categories)
✅ Category list views (/c/*/l/)
✅ All duplicate formats (/*.json, /*.rss)
✅ User notifications (/notifications, /my/*)
```

#### Task 3: Test & Verify Blocking
**Time Required:** 30 minutes

**Test These URLs (should be BLOCKED):**
```
❌ https://sanjal.com/u/any-username
❌ https://sanjal.com/tag/any-tag
❌ https://sanjal.com/latest
❌ https://sanjal.com/t/any-topic/123?page=2
```

**Test These URLs (should be ALLOWED):**
```
✅ https://sanjal.com/t/any-topic/123
✅ https://sanjal.com/c/any-category
✅ https://sanjal.com/uploads/
```

**Use Google's Robots.txt Tester:**
```
1. Go to: https://search.google.com/test/robots-txt-tester
2. Enter sanjal.com
3. Paste robots.txt content
4. Test sample URLs
5. Verify correct blocking/allowing
```

**Deliverable:** Enhanced robots.txt live and verified

---

### DAY 2-3: TITLE EMERGENCY AUDIT

#### Task 1: Export All Topic URLs (Already Done)
**Time Required:** 5 minutes

**File Available:**
```
gsc_all_urls_complete.csv - Contains all 4,373 topic URLs
Location: gsc-analysis-and-action-plan/gsc_all_urls_complete.csv
```

#### Task 2: Sample & Rate Titles
**Time Required:** 2 hours

**Process:**
1. Open the CSV file with all 4,373 URLs
2. Visit first 50 URLs randomly
3. Rate each title:
   ```
   SCORING:
   5 = Perfect - Descriptive, keyword-rich, 40-60 chars
   4 = Good - Clear but could add keywords
   3 = Fair - Too generic or vague
   2 = Poor - User slang, no keywords
   1 = Terrible - "Help!" "Question" "Please read"
   ```

4. **Create Title Audit Spreadsheet:**
   ```
   URL | Current Title | Score | Keywords Missing | Proposed New Title
   ```

#### Task 3: Identify Worst 100 Titles
**Time Required:** 1 hour

**Sort by score and find patterns:**
```
Common bad title patterns:
❌ "Help please"
❌ "Question"
❌ "Anyone know?"
❌ "Urgent!!!"
❌ Single word titles
❌ All caps titles
❌ No context titles
```

**Create priority list of 100 worst titles to fix immediately**

#### Task 4: Fix First 20 Titles
**Time Required:** 2 hours (6 min per title)

**Title Rescue Formula:**
```
[Topic] + [Specific Detail] + [Value/Benefit] + [Year if relevant]

Examples:
❌ "Visa help" 
✅ "Complete Guide to Nepal Tourist Visa Requirements 2026"

❌ "Bus to Pokhara?"
✅ "Kathmandu to Pokhara Bus: Routes, Prices & Travel Tips"

❌ "Cricket news"
✅ "Nepal Cricket Team News: Latest Matches & Rankings"
```

**In Discourse Admin:**
```
1. Open topic
2. Edit title (pencil icon)
3. Rewrite using formula above
4. Click Save
5. Track in spreadsheet
```

**Deliverable:** 20 titles optimized, 80 more identified for Week 2

---

### DAY 3-4: FIX TECHNICAL ERRORS

#### Task 1: Export Error Data from GSC
**Time Required:** 15 minutes

**Export Each Error Type:**
```
☐ Not found (404) - 9 pages → Save as "404-errors.csv"
☐ Server error (5xx) - 5 pages → Save as "5xx-errors.csv"
```

**Same process:** GSC → Pages → Click error type → Export → Download CSV

---

### DAY 2: Fix 404 Errors

#### Task 1: Review 404 URLs
**Time Required:** 30 minutes

1. Open `404-errors.csv`
2. For each of the 9 URLs, note the topic ID from the URL:
   - Example: `https://sanjal.com/t/topic-name/1234`
   - Topic ID = `1234`

**Create a tracking sheet:**
```
URL | Topic ID | Status | Action Needed
----|----------|--------|---------------
url1| 1234     | ?      | ?
url2| 5678     | ?      | ?
...
```

#### Task 2: Check If Topics Still Exist
**Time Required:** 30 minutes

**In Discourse Admin Panel:**
1. Go to **Admin → Tools → Screened URLs** (or use search)
2. For each topic ID, visit: `https://sanjal.com/t/[topic-id]`
3. Document the status:
   - ✅ **Exists** - Topic is there but URL changed
   - ❌ **Deleted** - Topic was deleted by user/admin
   - 🔒 **Private** - Moved to private category
   - ⚠️ **Other** - Something else

#### Task 3: Fix Each 404
**Time Required:** 45 minutes

**For DELETED topics:**
```
Action: Remove from sitemap (automatic on next generation)
No other action needed - 404 is correct response
```

**For EXISTING topics (URL changed):**
```
1. Admin → Customize → Permalinks
2. Click "Add Permalink"
3. Old URL: /t/old-slug/1234
4. New URL: /t/new-slug/1234
5. Save
```

**For PRIVATE topics:**
```
1. Remove from sitemap (check category settings)
2. Admin → Categories → [Category] → Settings
3. Verify "Include in search" is unchecked for private categories
```

**Expected Outcome:** All 9 404s either redirected or confirmed as properly deleted

---

### DAY 3: Investigate 5xx Errors

#### Task 1: Identify Problem URLs
**Time Required:** 20 minutes

1. Open `5xx-errors.csv`
2. List all 5 URLs
3. Note any patterns:
   - Are they all in the same category?
   - Are they very long threads?
   - Do they have special characters?

#### Task 2: Test URLs Manually
**Time Required:** 30 minutes

**For each of the 5 URLs:**
```
1. Open URL in browser (logged out)
2. Note what happens:
   ☐ Loads perfectly - 5xx was temporary
   ☐ Times out - Thread too large
   ☐ Shows error - Something broken
   ☐ Loads slowly (10+ seconds) - Performance issue
```

#### Task 3: Check Admin Logs
**Time Required:** 30 minutes

**In Discourse:**
1. Go to **Admin → Logs → Errors**
2. Search for the topic IDs from the 5 URLs
3. Look for recent errors matching:
   - "timeout"
   - "500"
   - "502"
   - "503"
   - "504"
4. Note any error messages

#### Task 4: Solutions for 5xx Errors

**If errors were TEMPORARY:**
```
✅ Use GSC URL Inspection tool to request re-crawl
✅ Monitor for next 2 weeks
```

**If threads are TOO LARGE:**
```
⚠️ May need hosting provider help for:
   - Increase timeout limits
   - Enable caching
   - Optimize database queries
⚠️ Document issue for hosting provider
```

**If broken/corrupted:**
```
1. Admin → Posts → Find topic
2. Review for corrupted content
3. May need to rebuild HTML (hosting provider)
```

**Expected Outcome:** All 5 URLs either fixed or documented for hosting provider

---

### DAY 4: Configure Discourse Settings

#### Task 1: Content Quality Settings
**Time Required:** 20 minutes

**Navigation:** Admin → Settings → Posting

**Configure these settings:**
```
Setting                          | Set To  | Why
---------------------------------|---------|------------------------
min post length                  | 20      | Prevent "Thanks!" posts
min first post length            | 100     | Ensure substantive topics
min topic title length           | 15      | Descriptive titles
title min entropy                | 10      | Avoid generic "Help!" titles
body min entropy                 | 50      | Ensure meaningful content
allow uncategorized topics       | false   | Force organization
```

**How to change:**
1. Type setting name in filter box
2. Click to edit
3. Enter new value
4. Click ✓ to save

#### Task 2: Sitemap Settings
**Time Required:** 15 minutes

**Navigation:** Admin → Settings → Search "sitemap"

**Verify these settings:**
```
Setting                          | Should Be
---------------------------------|----------
enable_sitemap                   | ✓ checked
sitemap_refresh_interval         | 1 (daily)
show_category_page               | ✓ checked
```

#### Task 3: Category Settings
**Time Required:** 30 minutes

**For each main category:**
1. Admin → Categories → [Category Name]
2. Click Edit
3. Configure:
   ```
   ☐ Write compelling 200+ word description
   ☐ Upload category image/icon
   ☐ Set position (important ones first)
   ☐ Check "Include in search" ✓
   ☐ Set permissions appropriately
   ```
4. Save changes

**Expected Outcome:** Foundation settings configured for quality content

---

### DAY 5: Initial Content Audit Setup

#### Task 1: Sample URLs from "Not Indexed" List
**Time Required:** 30 minutes

1. Open `not-indexed-pages-2026-01-15.csv`
2. Sort by any available metric (or random)
3. Select first 20 URLs
4. Copy to new spreadsheet: `week1-audit-sample.csv`

#### Task 2: Create Audit Template
**Time Required:** 15 minutes

**Spreadsheet columns:**
```
URL | Title | Category | Replies | Views | Quality Score | Action | Notes
```

**Quality Score Guide:**
```
5 = Excellent - Just needs minor tweaks
4 = Good - Needs moderate improvement
3 = Fair - Needs significant work
2 = Poor - Consider merging or noindexing
1 = Very Poor - Delete or noindex
```

#### Task 3: Audit First 10 Topics
**Time Required:** 60 minutes (6 min per topic)

**For each topic, evaluate:**
```
☐ Title: Is it descriptive and keyword-rich?
☐ Opening post: Is it 100+ words with clear value?
☐ Replies: Are there 3+ substantial replies?
☐ Views: Does it have 50+ views?
☐ Engagement: Recent activity or discussion?
☐ Uniqueness: Does it offer unique perspective?
☐ Completeness: Is the question answered?
```

**Example evaluation:**
```
URL: https://sanjal.com/t/nepal-travel-tips/1234
Title: "Nepal travel tips" (5/10 - too generic)
Opening Post: 2 sentences (Poor - needs expansion)
Replies: 1 reply (Poor - minimal discussion)
Quality Score: 2
Action: Improve or Merge with better travel thread
```

#### Task 4: Categorize Your Sample
**Time Required:** 15 minutes

**Group the 10 topics into:**
```
Keep & Improve: ___ topics → Focus on these
Merge: ___ topics → Find similar threads
Noindex: ___ topics → Too thin
Delete: ___ topics → Spam/irrelevant
```

**Expected Outcome:** Understanding of content quality landscape + first 10 topics audited

---

### DAY 6-7: Weekend - Review & Plan

#### Saturday: Review Week 1 Progress

**Checklist:**
```
☐ All GSC data exported
☐ 404 errors fixed or documented
☐ 5xx errors investigated
☐ Discourse settings configured
☐ First 10 topics audited
☐ Audit template created
```

#### Sunday: Prepare for Week 2

**Tasks:**
```
☐ Review quality scores from first 10 topics
☐ Identify patterns in low-quality content
☐ Plan which topics to improve in Week 2
☐ Draft template for topic improvements
```

---

## 📅 WEEK 2: CONTENT IMPROVEMENT (First 30 Topics)
**Focus:** Actually improving content quality

### DAY 8: Continue Content Audit

#### Task: Audit Another 20 Topics
**Time Required:** 2 hours

**Using your template from Week 1:**
- Audit topics 11-30 from your sample
- Use same quality scoring system
- Categorize each topic
- Note improvement opportunities

**Target:**
```
Total Audited: 30 topics
Keep & Improve: ~10-15 topics (focus here)
Merge: ~5-10 topics
Noindex: ~5-10 topics
```

---

### DAY 9-10: Improve High-Potential Topics (Part 1)

#### Process for Each Topic Improvement
**Time Required:** 20-30 min per topic

**Template for Improvement:**

1. **Enhance the Title**
   ```
   Before: "Help with visa"
   After: "Complete Guide to Nepal Tourist Visa: Requirements, Fees & Application Process 2026"
   ```

2. **Expand Opening Post**
   ```
   Add these elements:
   ☐ Clear question/topic introduction (50+ words)
   ☐ Background context (what, why, when)
   ☐ Specific details or examples
   ☐ What you've tried (if Q&A)
   ☐ Why it matters
   ☐ Related resources/links
   
   Target: 200-300 words minimum
   ```

3. **Add Visual Elements**
   ```
   ☐ Relevant image (if applicable)
   ☐ Formatting (headers, bullets, bold)
   ☐ Code blocks (if technical)
   ☐ Quotes or callouts
   ```

4. **Internal Linking**
   ```
   ☐ Link to 2-3 related topics
   ☐ Link to category page
   ☐ Link to relevant resources
   ```

5. **Update Information**
   ```
   ☐ Check if info is current
   ☐ Add recent developments
   ☐ Note any changes since original post
   ```

#### Goal for Day 9-10: Improve 10 Topics

**Track your improvements:**
```
Topic | Before Score | Actions Taken | After Score | Date
------|-------------|---------------|-------------|------
```

---

### DAY 11-12: Improve High-Potential Topics (Part 2)

#### Continue Improvements
**Time Required:** 2 hours per day

**Day 11:** Improve 5 more topics (total: 15)  
**Day 12:** Improve 5 more topics (total: 20)

**Quality Checklist for Each:**
```
☐ Title is descriptive and keyword-rich
☐ Opening post is 200+ words
☐ Content provides unique value
☐ Includes visual formatting
☐ Has internal links
☐ Information is current
☐ Question is answered (if Q&A)
```

---

### DAY 13: Merge Duplicate Topics

#### Task 1: Identify Merge Candidates
**Time Required:** 30 minutes

From your audit, find topics about the same subject:
```
Example:
- "Nepal visa help" (2 replies)
- "Tourist visa Nepal" (1 reply)  
- "How to get Nepal visa" (3 replies)
→ Merge into ONE comprehensive thread
```

#### Task 2: Merge Process
**Time Required:** 20 min per merge

**In Discourse:**
1. Open the BEST quality topic (keep this one)
2. Improve its title and opening post
3. For each duplicate topic:
   - Select all posts
   - Click "Select Posts" (wrench icon)
   - Choose "Move to Topic"
   - Select destination topic
   - Move posts
4. Close the now-empty original topics
5. Add post explaining the merge (optional)

**Discourse Admin Method:**
1. Admin → Posts → Search
2. Find topic posts
3. Select → Move to existing topic
4. Choose destination

**Goal:** Merge 3-5 duplicate topic groups

---

### DAY 14: Week 2 Review

#### Review Metrics
**Time Required:** 1 hour

**Count your progress:**
```
☐ Topics audited: 30
☐ Topics improved: 20
☐ Topic groups merged: 3-5
☐ Total merged topics: 10-15
☐ Net high-quality topics: 20-30
```

**Check GSC:**
```
☐ Visit Google Search Console
☐ Check if any "not indexed" count changed
☐ Verify 404 errors = 0
☐ Verify 5xx errors = 0
```

**Note:** Changes may take 2-4 weeks to show in GSC

---

## 📅 WEEK 3: SCALE UP & CATEGORY OPTIMIZATION
**Focus:** Process refinement + category-level improvements

### DAY 15-16: Batch Content Improvements

#### Increase Daily Output
**Time Required:** 3 hours per day

**Now that you have a process:**
- Audit 10 topics per day
- Improve 5-8 topics per day
- Track everything in your spreadsheet

**Running Totals by Day 16:**
```
Total Audited: 50 topics
Total Improved: 35-40 topics
Total Merged: 15-20 topic groups
```

---

### DAY 17: Category Description Optimization

#### Task: Upgrade All Category Pages
**Time Required:** 2-3 hours

**For EACH category on your forum:**

1. **Write Long-Form Description (200-300 words)**
   ```
   Include:
   ☐ What the category is about
   ☐ What topics belong here
   ☐ Why it's valuable
   ☐ Guidelines for posting
   ☐ Related categories
   ☐ Keywords naturally integrated
   ```

2. **Create "About" Pinned Topic**
   ```
   Title: "About [Category Name]: Guidelines & Resources"
   Content:
   ☐ Category purpose (100+ words)
   ☐ Posting guidelines
   ☐ Best practices
   ☐ Link to top 5 topics in category
   ☐ FAQs
   ☐ Related resources
   ```
   
   Set as: Pinned Globally in category

3. **Add Category Image**
   ```
   ☐ Upload relevant header image
   ☐ Or choose category icon/emoji
   ```

**Expected:** All major categories have rich descriptions

---

### DAY 18: Noindex Low-Value Content

#### Task 1: Identify Noindex Candidates
**Time Required:** 1 hour

From your audits, find topics with:
- Quality Score: 1-2
- Very few replies (1-2)
- Low views (< 20)
- No unique value
- Can't be easily improved

**Create a list:** 20-30 topics to noindex

#### Task 2: Bulk Noindex Process

**Option 1: Move to "Noindex" Category**
```
1. Admin → Categories → New Category
2. Name: "Archived - Low Value" (or similar)
3. Settings:
   - Include in search: ✗ unchecked
   - Visible: Only to admins
4. Bulk move low-value topics here
```

**Option 2: robots.txt Pattern**
```
1. Identify URL patterns
   Example: All topics in specific tag
2. Admin → Customize → robots.txt
3. Add pattern:
   Disallow: /tag/low-value/
   Disallow: /c/archived/
```

**Option 3: Close Topics**
```
1. Select topics → Bulk Actions
2. Close topics
   (Closed topics may get lower priority in indexing)
```

**Goal:** Noindex or de-prioritize 20-30 low-value topics

---

### DAY 19: Install SEO Plugins (If Possible)

#### Check Plugin Access
**Time Required:** 1-2 hours

**Navigation:** Admin → Plugins

**Try to install:**

1. **discourse-solved**
   ```
   Benefit: Mark best answers in Q&A topics
   SEO Impact: Shows resolution status to Google
   ```

2. **discourse-topic-voting**
   ```
   Benefit: Upvote quality topics
   SEO Impact: Highlights valuable content
   ```

3. **discourse-assign**
   ```
   Benefit: Assign topics to experts
   SEO Impact: Shows authority/ownership
   ```

**If you CAN'T install plugins:**
- Document which ones you want
- Request from hosting provider
- Continue with other improvements

**If you CAN install:**
- Configure each plugin
- Apply to appropriate categories
- Mark solved topics
- Enable voting on main categories

---

### DAY 20-21: Weekend - Big Picture Review

#### Saturday: Analytics Review

**Check Multiple Sources:**

1. **Google Search Console**
   ```
   ☐ Pages indexed (any change?)
   ☐ "Not indexed" count (trending down?)
   ☐ Technical errors (should be 0)
   ☐ Average position (any improvement?)
   ```

2. **Discourse Analytics**
   ```
   Admin → Dashboard → Reports
   ☐ Page views trend
   ☐ User engagement
   ☐ New topics quality
   ☐ Top performing content
   ```

3. **Your Tracking Spreadsheet**
   ```
   ☐ Total topics audited: ~50
   ☐ Total topics improved: ~40
   ☐ Total merged: ~20
   ☐ Net quality improvement: Significant
   ```

#### Sunday: Plan Next Phase

**Assess What's Working:**
```
☐ Which improvements got best results?
☐ Which categories need most work?
☐ What patterns in quality content?
☐ Where to focus Week 4?
```

---

## 📅 WEEK 4: MOMENTUM & SUSTAINABILITY
**Focus:** Scale improvements + build sustainable process

### DAY 22-24: Accelerated Improvements

#### Daily Routine (established workflow)
**Time Required:** 2-3 hours per day

**Each day:**
```
☐ Audit 15 new topics
☐ Improve 10 topics
☐ Merge 2-3 duplicate groups
☐ Update tracking spreadsheet
```

**By end of Day 24:**
```
Total Audited: ~100 topics
Total Improved: ~70 topics
Total Merged: ~30 topic groups
```

---

### DAY 25: Community Guidelines Implementation

#### Task: Establish Quality Standards
**Time Required:** 2 hours

1. **Create "How to Post Quality Content" Guide**
   ```
   Create new pinned topic in "Site Feedback" category
   
   Title: "Posting Guidelines: How to Create Valuable Topics"
   
   Content:
   ☐ Minimum post length expectations
   ☐ How to write good titles
   ☐ What makes valuable discussion
   ☐ Examples of great topics
   ☐ Examples of topics to avoid
   ☐ Search before posting (avoid duplicates)
   ```

2. **Update Category Descriptions**
   ```
   Add to each category description:
   "Please review posting guidelines before creating topics"
   Link to your guidelines topic
   ```

3. **Create Topic Template**
   ```
   For main categories, add suggested format:
   
   **Topic:** [Clear, specific title]
   **Background:** [Context, what you know]
   **Question:** [Specific question or discussion point]
   **Why It Matters:** [Relevance, importance]
   ```

---

### DAY 26: User Badge System

#### Task: Reward Quality Contributions
**Time Required:** 1 hour

**Navigation:** Admin → Badges

**Create custom badges:**

1. **"Quality Contributor"**
   ```
   Criteria: Topics with 10+ likes
   Benefit: Encourages substantive posts
   ```

2. **"Comprehensive Answer"**
   ```
   Criteria: Posts with 200+ words + 5+ likes
   Benefit: Rewards detailed responses
   ```

3. **"Community Helper"**
   ```
   Criteria: 50+ helpful replies
   Benefit: Recognizes active helpers
   ```

**Assign badges manually to:**
- Users who created your best topics
- Users who give detailed answers
- Active community contributors

---

### DAY 27: Month 1 Comprehensive Review

#### Task 1: Data Collection
**Time Required:** 1 hour

**Google Search Console:**
```
☐ Export current "not indexed" count
☐ Compare to Week 1 baseline
☐ Export any newly indexed pages
☐ Check technical error counts
☐ Review performance metrics
```

**Discourse:**
```
☐ Check engagement metrics
☐ Review new content quality
☐ Assess community response to changes
```

#### Task 2: Success Analysis
**Time Required:** 1 hour

**Calculate Impact:**
```
Week 1 Baseline:
- Not indexed: 4,840
- 404 errors: 9
- 5xx errors: 5
- Estimated indexed: ~160

Week 4 Status:
- Not indexed: ___? (may not change yet - Google is slow)
- 404 errors: ___ (target: 0)
- 5xx errors: ___ (target: 0)
- Topics improved: ~70
- Topics merged: ~30
```

**Note:** Full indexing impact may take 4-12 weeks to appear in GSC

#### Task 3: Document Learnings
**Time Required:** 30 minutes

**Create notes:**
```
☐ What worked best?
☐ What was most time-consuming?
☐ What should we prioritize in Month 2?
☐ Any unexpected challenges?
☐ What should we stop doing?
☐ What should we do more of?
```

---

### DAY 28: Month 2 Planning

#### Task: Create Next Phase Plan
**Time Required:** 1-2 hours

**Month 2 Goals:**
```
☐ Improve another 100 topics (total: 170)
☐ Optimize all category pages
☐ Complete audit of top 200 "not indexed" pages
☐ Implement structured data (if possible)
☐ Request GSC re-crawl of improved pages
```

**Weekly Breakdown:**
```
Week 5: Audit next 50 topics, improve 30
Week 6: Category-level deep optimization
Week 7: Advanced improvements + schema
Week 8: Review + scale successful tactics
```

**Sustainable Routine:**
```
Daily: Improve 5 topics (30 min)
Weekly: Audit 15 new topics (1 hour)
Monthly: Review GSC metrics (1 hour)
```

---

## 📊 WEEK-BY-WEEK TRACKING TEMPLATE

### Copy This Template to Track Progress

```
WEEK 1 (Data & Technical)
☐ GSC data exported
☐ 404 errors fixed: __/9
☐ 5xx errors addressed: __/5
☐ Settings configured
☐ First 10 topics audited

WEEK 2 (Content Improvement)
☐ Topics audited: __/30
☐ Topics improved: __/20
☐ Topic groups merged: __/5
☐ Quality score average: __

WEEK 3 (Scale & Categories)
☐ Topics audited: __/50 (total)
☐ Topics improved: __/40 (total)
☐ Categories optimized: __/__ (total)
☐ Topics noindexed: __/30
☐ Plugins installed: __/__

WEEK 4 (Momentum)
☐ Topics audited: __/100 (total)
☐ Topics improved: __/70 (total)
☐ Community guidelines: Created
☐ Badge system: Implemented
☐ Month 2 plan: Ready

METRICS (End of Month 1)
GSC "Not Indexed": ____ (baseline: 4,840)
GSC 404 Errors: ____ (baseline: 9, target: 0)
GSC 5xx Errors: ____ (baseline: 5, target: 0)
Topics Improved: ____ (target: 70)
Quality Content: ____ pages ready for indexing
```

---

## 🎯 EXPECTED OUTCOMES AFTER 4 WEEKS

### Technical Health
```
✅ Zero 404 errors
✅ Zero or minimal 5xx errors
✅ All settings optimized
✅ Sitemap functioning perfectly
```

### Content Quality
```
✅ 70+ topics significantly improved
✅ 30+ duplicate topics merged
✅ 20+ low-value topics noindexed
✅ All categories have rich descriptions
✅ Clear quality guidelines established
```

### Foundation for Growth
```
✅ Content audit process established
✅ Improvement template created
✅ Tracking system in place
✅ Community standards set
✅ Sustainable routine developed
```

### SEO Progress (May Not Show Yet)
```
⏳ Google needs 4-12 weeks to re-crawl
⏳ Indexing changes appear slowly
⏳ Position improvements take time
✅ But foundation is solid for future growth
```

---

## 💡 TIPS FOR SUCCESS

### Time Management
```
☐ Set aside same time daily (30-60 min)
☐ Don't try to do everything at once
☐ Focus on quality over speed
☐ Take breaks - avoid burnout
```

### Stay Organized
```
☐ Keep tracking spreadsheet updated
☐ Document all changes
☐ Save before/after examples
☐ Note what works best
```

### Manage Expectations
```
☐ GSC updates are SLOW (4-12 weeks lag)
☐ Not all 4,840 pages will be indexed
☐ Aim for 800-1,000 indexed (realistic)
☐ Focus on progress, not perfection
```

### Community Communication
```
☐ Explain changes to active users
☐ Encourage quality over quantity
☐ Recognize good contributors
☐ Lead by example
```

---

## 🎬 WHAT'S NEXT?

After completing Week 4, proceed to:

**→ `03-content-quality-handbook.md`**

This guide provides:
- Detailed content audit criteria
- Topic improvement examples (before/after)
- Category optimization strategies
- Advanced techniques for stubborn pages
- Long-term content strategy

---

**Questions during Week 1-4?**  
Refer back to `01-admin-quick-start-guide.md` for admin panel navigation and troubleshooting.

---

*Document: 2 of 3*  
*Status: Week-by-Week Action Plan*  
*Next: Content Quality Handbook*
