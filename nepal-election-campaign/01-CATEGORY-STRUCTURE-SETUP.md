# Category Structure Setup Guide

**Purpose:** Step-by-step instructions for setting up Nepal Elections 2026 category structure in Discourse  
**Time Required:** 30-45 minutes  
**Prerequisites:** Discourse admin access

---

## 📁 Recommended Category Structure

```
🗳️ Nepal Elections 2026 (Main Category)
   ├── 📊 Election Information & Schedule
   ├── 🏛️ Candidates & Political Parties
   ├── 🗺️ Constituency Discussions
   ├── 📝 Voter Guides & Registration
   ├── 📡 Live Updates & Results
   └── 💬 Analysis & Debates
```

---

## 🎯 Category Design Philosophy

### **Why This Structure Works**

1. **SEO-Friendly:** Each subcategory targets specific keyword clusters
2. **User-Friendly:** Clear navigation for different information needs
3. **Scalable:** Can handle 75+ threads without clutter
4. **Engagement-Optimized:** Encourages discussion in focused areas
5. **Content Lifecycle:** Supports pre-election, election day, and post-election phases

---

## 🛠️ Step-by-Step Implementation

### **Step 1: Create Main Category**

1. **Navigate to:** Admin → Categories → New Category
2. **Settings:**
   - **Name:** `Nepal Elections 2026`
   - **Slug:** `nepal-elections-2026`
   - **Color:** `#E74C3C` (red - attention-grabbing)
   - **Description:** 
     ```
     Discussion hub for Nepal Elections 2026 - March 5th. 
     Candidate info, voter guides, live updates, and community analysis.
     ```
   - **Parent Category:** None (top-level)
   - **Permissions:** Everyone can create topics

3. **Advanced Settings:**
   - **Default View:** Latest
   - **Default Top Period:** Weekly
   - **Minimum Tags Required:** 0
   - **Allow Badges:** Yes

4. **Click:** Create Category

---

### **Step 2: Create Subcategory 1 - Election Information & Schedule**

1. **Navigate to:** Admin → Categories → New Category
2. **Settings:**
   - **Name:** `Election Information & Schedule`
   - **Slug:** `election-info-schedule`
   - **Color:** `#3498DB` (blue - informational)
   - **Description:**
     ```
     Official election dates, voting schedule, timeline, and important deadlines.
     ```
   - **Parent Category:** Nepal Elections 2026
   - **Permissions:** Everyone can create topics

3. **Purpose:** Houses foundational date/schedule threads
4. **Target Keywords:** "nepal election 2026 date", "voting schedule", "election timeline"

---

### **Step 3: Create Subcategory 2 - Candidates & Political Parties**

1. **Settings:**
   - **Name:** `Candidates & Political Parties`
   - **Slug:** `candidates-parties`
   - **Color:** `#9B59B6` (purple - political)
   - **Description:**
     ```
     Candidate profiles, party manifestos, political analysis, and comparisons.
     ```
   - **Parent Category:** Nepal Elections 2026

2. **Purpose:** Candidate-focused discussions
3. **Target Keywords:** "nepal candidates 2026", "party manifesto", "candidate profile"

---

### **Step 4: Create Subcategory 3 - Constituency Discussions**

1. **Settings:**
   - **Name:** `Constituency Discussions`
   - **Slug:** `constituencies`
   - **Color:** `#E67E22` (orange - local)
   - **Description:**
     ```
     Local election discussions organized by constituency. Find your area and join the conversation.
     ```
   - **Parent Category:** Nepal Elections 2026

2. **Purpose:** Geographical organization - 77 constituencies
3. **Target Keywords:** "[constituency name] candidates", "local election", "district"

---

### **Step 5: Create Subcategory 4 - Voter Guides & Registration**

1. **Settings:**
   - **Name:** `Voter Guides & Registration`
   - **Slug:** `voter-guides`
   - **Color:** `#27AE60` (green - helpful)
   - **Description:**
     ```
     How to vote, registration process, first-time voter guides, and voting requirements.
     ```
   - **Parent Category:** Nepal Elections 2026

2. **Purpose:** Educational content for voters
3. **Target Keywords:** "how to vote nepal", "voter registration", "first time voter"

---

### **Step 6: Create Subcategory 5 - Live Updates & Results**

1. **Settings:**
   - **Name:** `Live Updates & Results`
   - **Slug:** `live-updates-results`
   - **Color:** `#E74C3C` (red - urgent)
   - **Description:**
     ```
     Real-time election day updates, polling booth reports, live results tracking, and outcome analysis.
     ```
   - **Parent Category:** Nepal Elections 2026

2. **Purpose:** Time-sensitive election day content
3. **Target Keywords:** "nepal election results live", "election updates", "live results"

---

### **Step 7: Create Subcategory 6 - Analysis & Debates**

1. **Settings:**
   - **Name:** `Analysis & Debates`
   - **Slug:** `analysis-debates`
   - **Color:** `#34495E` (dark blue - thoughtful)
   - **Description:**
     ```
     Political analysis, election predictions, policy debates, and community perspectives.
     ```
   - **Parent Category:** Nepal Elections 2026

2. **Purpose:** Opinion and analysis content
3. **Target Keywords:** "election analysis", "political debate", "election predictions"

---

## 🎨 Category Customization

### **Homepage Visibility**

1. **Navigate to:** Admin → Settings → Basic Setup
2. **Set:** "Desktop Category Page Style" → `Categories with Featured Topics`
3. **Pin:** "Nepal Elections 2026" category to top of homepage

### **Mobile Optimization**

1. **Navigate to:** Admin → Settings → Mobile
2. **Enable:** Mobile category navigation
3. **Set:** "Nepal Elections 2026" as featured category

### **Category Widgets**

Add to "Nepal Elections 2026" category page:

```html
<div class="election-countdown">
  <h3>Election Day Countdown</h3>
  <p><strong>March 5, 2026</strong></p>
  <p>🗳️ Days Remaining: <span id="days"></span></p>
</div>
```

---

## 📋 Category Settings Checklist

After creating all categories, verify:

- [ ] All 6 subcategories created under main category
- [ ] Color-coding applied for visual distinction
- [ ] Descriptions include relevant keywords
- [ ] Permissions set to allow public participation
- [ ] Categories visible on homepage
- [ ] Mobile navigation enabled
- [ ] Category order: Info → Candidates → Constituencies → Voter Guides → Live Updates → Analysis

---

## 🏗️ Category Organization Best Practices

### **Thread Placement Guidelines**

| Thread Type | Recommended Category |
|-------------|---------------------|
| "Nepal Election March 5, 2026 - Complete Schedule" | Election Information & Schedule |
| "Narendra Modi vs Rahul Gandhi - Comparison" | Candidates & Political Parties |
| "Kathmandu District 1 Candidates List" | Constituency Discussions |
| "First-Time Voter Guide - What to Bring" | Voter Guides & Registration |
| "Election Day Live Updates Thread" | Live Updates & Results |
| "Who Will Win? Predictions and Analysis" | Analysis & Debates |

### **Pinning Strategy**

**Pin to Main Category:**
- "Welcome to Nepal Elections 2026 - Start Here"
- "Election Day: March 5, 2026 - Countdown & Info"

**Pin to Subcategories:**
- Election Information: "Complete Election Schedule"
- Candidates: "All Parties Manifesto Comparison"
- Constituencies: "Find Your Constituency Thread"
- Voter Guides: "How to Vote - Step by Step"
- Live Updates: "Live Results Megathread" (on election day)

---

## 🔍 SEO Configuration

### **Category Meta Descriptions**

Set in Admin → Categories → [Category] → Settings → Meta Description:

**Main Category:**
```
Nepal Elections 2026 discussion hub. Complete candidate info, voter guides, 
live results for March 5th election. Join the conversation at Sanjal.com.
```

**Subcategories (examples):**
```
Election Information: "Nepal election 2026 schedule, voting dates, and timeline. 
Complete guide to election day March 5, 2026."

Candidates: "Complete Nepal election 2026 candidate profiles, party manifestos, 
and political analysis."
```

### **Sitemap Inclusion**

1. Verify categories appear in: `https://sanjal.com/sitemap.xml`
2. Submit updated sitemap to Google Search Console
3. Monitor indexing in GSC → Coverage report

---

## 📊 Category Performance Tracking

### **Metrics to Monitor**

For each category, track:
- **Total threads:** Target 10-15 per category
- **Total posts:** Measure engagement
- **Unique visitors:** Category-level traffic
- **Time on page:** Indicates content quality

### **Google Analytics Setup**

Create category-specific UTM tags for external promotion:
```
https://sanjal.com/c/nepal-elections-2026/election-info-schedule?utm_source=facebook&utm_medium=social&utm_campaign=election2026
```

---

## 🚨 Common Setup Mistakes to Avoid

❌ **Don't:**
- Create too many subcategories (max 6-8)
- Use generic names ("Discussion", "General")
- Forget to set parent category
- Mix election content with existing categories
- Hide categories from homepage

✅ **Do:**
- Use descriptive, keyword-rich names
- Apply consistent color scheme
- Link subcategories to main category
- Feature prominently on homepage
- Set clear descriptions

---

## 🔄 Post-Setup Actions

### **Immediate (Day 1)**
1. ✅ Create welcome thread in main category
2. ✅ Post 2-3 foundational threads in each subcategory
3. ✅ Pin important threads
4. ✅ Test mobile navigation
5. ✅ Announce new section on existing categories

### **Week 1**
1. Monitor user questions about category structure
2. Adjust if users are confused about where to post
3. Cross-link related threads between categories
4. Add category-specific tags

---

## 📱 Mobile Preview

Test on mobile devices:
- Category navigation is clear
- Colors are visible
- Descriptions aren't truncated
- Tap targets are adequately sized
- Subcategories are easy to access

---

## ✅ Setup Complete Checklist

Before considering setup complete:

- [ ] Main category "Nepal Elections 2026" created
- [ ] 6 subcategories created and organized
- [ ] All color-coding applied
- [ ] Descriptions added (keyword-optimized)
- [ ] Permissions set correctly
- [ ] Homepage visibility configured
- [ ] Mobile optimization verified
- [ ] Welcome threads posted in each category
- [ ] Pinning strategy implemented
- [ ] Sitemap submitted to Google
- [ ] Analytics tracking configured

---

**Estimated Setup Time:** 30-45 minutes  
**Next Step:** Begin posting content using templates from `03-THREAD-TEMPLATES-LIBRARY.md`  
**Support Reference:** Discourse Category Setup Documentation

---

**Last Updated:** January 28, 2026  
**Status:** Ready for Implementation  
**Next Document:** `02-CONTENT-STRATEGY-FRAMEWORK.md`
