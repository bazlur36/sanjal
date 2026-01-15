# How to Get URLs That Are "Crawled - Currently Not Indexed"

## The Problem
You exported the **Coverage report** which shows statistics over time, but you need the **actual list of URLs** that Google has crawled but not indexed.

## Current File Analysis
Your current file `sanjal.com-Coverage-2026-01-15.xlsx` contains:
- **Date** column: Time series data
- **Not indexed** column: Count of not indexed pages on that date
- **Indexed** column: Count of indexed pages on that date  
- **Impressions** column: Search impressions

This shows you have around 829-1004 pages not indexed (based on recent dates), but **NOT the actual URLs**.

## ✅ CORRECT Way to Export URLs

### Step-by-Step Instructions:

1. **Go to Google Search Console**
   - Visit: https://search.google.com/u/0/search-console/

2. **Select Your Property**
   - Make sure `sc-domain:sanjal.com` is selected

3. **Navigate to the Pages Report**
   - Click on **"Pages"** in the left sidebar (under "Indexing")

4. **Find "Crawled - currently not indexed"**
   - Scroll down to the **"Why pages aren't indexed"** section
   - Look for the row that says **"Crawled - currently not indexed"**
   - You should see a number (probably around 4,840 based on your guide)

5. **Click on "Crawled - currently not indexed"**
   - Click directly on the text "Crawled - currently not indexed"
   - This will open a detailed view showing **the actual URLs**

6. **Export the URL List**
   - In the top-right corner, click the **Export** icon (📤)
   - Choose **"Download CSV"** or **"Download Excel"**
   - Save the file with a clear name like: `sanjal-crawled-not-indexed-urls.csv`

### What the Exported File Should Contain:

The correct export will have columns like:
- **URL** (or "Page URL") - The actual page addresses
- **Last crawled** (optional) - When Google last visited
- Other possible columns depending on the view

### Example of What You Should See:

```
URL
https://sanjal.com/t/some-topic-title/12345
https://sanjal.com/t/another-topic/67890
https://sanjal.com/c/some-category/23456
...
```

## 🚀 Once You Have the URL List

After exporting the correct file with URLs, you can:

### 1. Quick Analysis
Run this command to see how many URLs you have:
```bash
wc -l sanjal-crawled-not-indexed-urls.csv
```

### 2. Preview the URLs
```bash
head -20 sanjal-crawled-not-indexed-urls.csv
```

### 3. Categorize by Type
```bash
# See how many topics vs categories vs other pages
grep -c "/t/" sanjal-crawled-not-indexed-urls.csv   # Topics
grep -c "/c/" sanjal-crawled-not-indexed-urls.csv   # Categories
grep -c "/u/" sanjal-crawled-not-indexed-urls.csv   # User profiles
```

### 4. Extract Different URL Types

Create separate files for different content types:

```bash
# Extract topic URLs
grep "/t/" sanjal-crawled-not-indexed-urls.csv > not-indexed-topics.txt

# Extract category URLs
grep "/c/" sanjal-crawled-not-indexed-urls.csv > not-indexed-categories.txt

# Extract user profile URLs
grep "/u/" sanjal-crawled-not-indexed-urls.csv > not-indexed-users.txt
```

## 📊 Alternative Exports from GSC

While you're in Google Search Console, also export these:

### 1. "Not found (404)" URLs
- Pages → Click on "Not found (404)" 
- Export → Save as `sanjal-404-errors.csv`
- These are the 9 pages mentioned in your guide

### 2. "Server error (5xx)" URLs
- Pages → Click on "Server error (5xx)"
- Export → Save as `sanjal-5xx-errors.csv`
- These are the 5 pages mentioned in your guide

## 🎯 What to Do After Export

Once you have the URL list:

1. **Prioritize High-Value Pages**
   - Look for topics with good titles
   - Identify categories that should be indexed
   - Find pages with potential traffic value

2. **Follow the Action Plan**
   - Refer to `01-admin-quick-start-guide.md`
   - Start with Week 1 tasks in `02-week-by-week-action-plan.md`
   - Begin improving top 20-30 pages

3. **Create an Audit Spreadsheet**
   - Open the CSV in Google Sheets or Excel
   - Add columns: "Action" (Keep/Improve/Merge/Delete), "Priority", "Notes"
   - Start reviewing URLs manually

## 🆘 Troubleshooting

### If you don't see "Crawled - currently not indexed":
- Make sure you're in the **Pages** report (not Performance)
- Scroll down to "Why pages aren't indexed" section
- The status might have a different count than expected

### If the export doesn't have URLs:
- Make sure you clicked **on the status text** (not just hovering)
- You should see a list of URLs before exporting
- Try using "Download CSV" instead of Excel if one doesn't work

### If there are too many URLs to export:
- GSC might limit exports to 1,000 rows
- Export in batches by using date filters
- Or manually copy the most important ones first

## 📝 Summary

**Wrong file:** Coverage report (what you have now)
- Shows: Statistics over time
- Contains: Dates and counts

**Right file:** URL list (what you need)
- Shows: Actual page URLs
- Contains: List of specific pages

**Next step:** Go to GSC → Pages → "Crawled - currently not indexed" → Export

---

**Questions?** Let me know if you need help interpreting the results once you get the URL list!
