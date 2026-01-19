# Search Query Data Files - Column Explanations

This document explains what each column means in the CSV files provided for your review.

---

## Files Included

1. **INTENT-MAPPING-ANALYSIS-SUMMARY.md** - Executive summary report
2. **client-data-nba-queries.csv** - Top 90 NBA queries analysis
3. **client-data-nepal-queries.csv** - All Nepal-related queries analysis

---

## Column Definitions

### **Query**
The exact search term people typed into Google that triggered your website to appear in search results.

**Example:** "nepal vs uae"

---

### **Impressions**
How many times your website appeared in Google search results for this query over the last 3 months.

- Higher number = more visibility
- **Example:** 54 impressions means your site showed up 54 times when people searched for this term

---

### **Clicks**
How many times people actually clicked on your website from the search results for this query.

- **Example:** 0 clicks means despite appearing 54 times, nobody clicked
- This is the main problem we're addressing

---

### **CTR (Click-Through Rate)**
Percentage of impressions that resulted in clicks.

**Formula:** (Clicks ÷ Impressions) × 100

- **0%** = Nobody clicking (current state for Nepal & NBA queries)
- **3-5%** = Typical CTR (healthy)
- **10-15%** = Excellent CTR (our target)

**Example:** If you have 100 impressions and 5 clicks, CTR = 5%

---

### **Position**
The average ranking position your website appeared at in Google search results for this query.

**How Google Rankings Work:**
- **Position 1-10** = First page (⭐ most visible)
- **Position 11-20** = Second page
- **Position 21-30** = Third page
- **Position 31+** = Fourth page and beyond

**Examples:**
- Position **4.61** = You're ranking 4-5th on first page (excellent!)
- Position **10.04** = You're at the bottom of first page / top of second page
- Position **60.45** = You're on page 6 (low visibility)

**Why Position Matters:**
- Position 1-3: Get ~60% of all clicks
- Position 4-10: Get ~30% of all clicks
- Position 11+: Get <10% of all clicks

---

### **Status** (Nepal queries only)
A visual indicator of where you're ranking to quickly identify opportunities.

**Status Labels:**

| Status | Position Range | Meaning |
|--------|----------------|---------|
| ⭐ First Page | 1-10 | Excellent position - just need better titles |
| Top of Page 2 | 10-12 | Very good - close to first page |
| Page 2 | 11-20 | Good - needs improvement |
| Page 3+ | 21+ | Need significant work |

**Example:** 
- "nepal vs uae" has status "⭐ First Page" because position is 4.61

---

### **Opportunity** (Nepal queries only)
My assessment of how valuable it would be to optimize this query.

**Opportunity Levels:**

| Level | Criteria | Action Priority |
|-------|----------|-----------------|
| **HIGH** | First page position (1-10) OR high impressions | Optimize immediately - quick wins! |
| **MEDIUM** | Page 2-3 position (11-30) | Moderate effort needed |
| **LOW** | Beyond page 3 (31+) | Lower priority |

**Why This Matters:**
- **HIGH opportunities = Quick wins**: Already ranking well, just need title fixes to boost CTR
- **MEDIUM opportunities**: Require more content work
- **LOW opportunities**: Need significant content investment

**Examples:**
- "nepal vs uae" - HIGH (Position 4.61, 54 impressions)
- "swarnim wagle" - MEDIUM (Position 27.33)
- "e passport nepal" - LOW (Position 80)

---

### **Category** (NBA queries only)
Type of NBA content being searched for.

**Categories:**
- **NBA Player Biography** - People wanting player history
- **NBA Hall of Fame** - Questions about Hall of Fame status
- **NBA Player** - General player searches
- **NBA Draft** - Draft-related queries
- **NBA Coach** - Coaching information
- **NBA Player Team** - Player + specific team
- etc.

**Why This Matters:** Shows the type of content users expect to find. Forums don't typically satisfy these information needs (why CTR is 0%).

---

## Key Insights from the Data

### **The Problem:**

1. **NBA Content:**
   - 1,500+ impressions per month
   - **0% CTR** across all queries
   - Positions vary widely (4-95)
   - **Diagnosis:** Content doesn't match search intent

2. **Nepal Content:**
   - ~150 impressions per month
   - **Positions 4-11** (excellent!)
   - **0% CTR** despite good positions
   - **Diagnosis:** Titles aren't compelling enough

### **The Opportunity:**

Nepal queries already rank on **first page** but get **zero clicks** because:
- Thread titles don't match what people searched for
- Meta descriptions aren't compelling
- Titles use forum slang instead of descriptive keywords

**Quick Win Example:**
- Query: "nepal vs uae"
- Current situation: Position 4.61, 54 impressions, 0 clicks
- Fix: Change thread title to "Nepal vs UAE Cricket Match: Live Updates & Analysis 2026"
- Expected result: **2-5 clicks per day** (10% CTR on 54 monthly impressions = ~5 clicks/month minimum)

---

## How to Use This Data

### **Step 1: Identify Quick Wins**
Look for Nepal queries with:
- ⭐ First Page status
- HIGH opportunity rating
- Multiple impressions

### **Step 2: Strategic Decision**
Based on the data, you need to decide:
- **Option A:** Invest in NBA content (not recommended - compete with ESPN)
- **Option B:** Focus on Nepal niche (recommended - you already rank well)

### **Step 3: Implementation**
If choosing Nepal focus:
1. Fix titles on top 10 Nepal threads
2. Create Nepal-focused categories
3. Consolidate NBA content into archive
4. Monitor CTR improvements in Google Search Console

---

## Questions?

If any column or metric needs further clarification, let me know and I'll provide more examples or explanations.

---

**Analysis Date:** January 19, 2026  
**Data Source:** Google Search Console (3-month period)  
**Total Queries Analyzed:** 670 unique search queries
