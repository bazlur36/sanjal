#!/bin/bash
# Script to analyze "Crawled but not indexed" URLs from Google Search Console
# Usage: ./analyze_crawled_not_indexed_urls.sh <csv-file>

if [ $# -eq 0 ]; then
    echo "❌ Error: No file provided"
    echo ""
    echo "Usage: $0 <csv-file>"
    echo "Example: $0 sanjal-crawled-not-indexed-urls.csv"
    echo ""
    echo "First, export the URL list from Google Search Console:"
    echo "1. Go to: https://search.google.com/search-console/"
    echo "2. Click: Pages → 'Crawled - currently not indexed'"
    echo "3. Export the URL list (not the coverage statistics)"
    exit 1
fi

CSV_FILE="$1"

if [ ! -f "$CSV_FILE" ]; then
    echo "❌ Error: File '$CSV_FILE' not found"
    exit 1
fi

echo "================================================================================"
echo "  CRAWLED BUT NOT INDEXED URLs - ANALYSIS REPORT"
echo "================================================================================"
echo ""

# Total URLs
TOTAL=$(tail -n +2 "$CSV_FILE" | wc -l)
echo "📊 TOTAL URLs: $TOTAL"
echo ""

# Check if file has URLs or just statistics
FIRST_LINE=$(head -2 "$CSV_FILE" | tail -1)
if echo "$FIRST_LINE" | grep -q "^[0-9]\{4\}-"; then
    echo "⚠️  WARNING: This looks like a Coverage statistics file (has dates)"
    echo "⚠️  You need to export the URL list, not the coverage chart!"
    echo ""
    echo "See: HOW-TO-GET-CRAWLED-NOT-INDEXED-URLS.md for instructions"
    echo ""
    exit 1
fi

echo "================================================================================"
echo "  URL TYPE BREAKDOWN"
echo "================================================================================"

# Topics
TOPICS=$(grep -c "/t/" "$CSV_FILE" 2>/dev/null || echo "0")
echo "📝 Topics (/t/):           $TOPICS"

# Categories  
CATEGORIES=$(grep -c "/c/" "$CSV_FILE" 2>/dev/null || echo "0")
echo "📁 Categories (/c/):       $CATEGORIES"

# User profiles
USERS=$(grep -c "/u/" "$CSV_FILE" 2>/dev/null || echo "0")
echo "👤 User Profiles (/u/):    $USERS"

# Tags
TAGS=$(grep -c "/tag/" "$CSV_FILE" 2>/dev/null || echo "0")
echo "🏷️  Tags (/tag/):           $TAGS"

# Other
OTHER=$((TOTAL - TOPICS - CATEGORIES - USERS - TAGS))
echo "❓ Other URLs:             $OTHER"

echo ""
echo "================================================================================"
echo "  CREATING FILTERED FILES"
echo "================================================================================"

# Create output directory
mkdir -p crawled-not-indexed-analysis

# Extract topics
if [ $TOPICS -gt 0 ]; then
    grep "/t/" "$CSV_FILE" > crawled-not-indexed-analysis/topics.txt
    echo "✅ Created: crawled-not-indexed-analysis/topics.txt ($TOPICS URLs)"
fi

# Extract categories
if [ $CATEGORIES -gt 0 ]; then
    grep "/c/" "$CSV_FILE" > crawled-not-indexed-analysis/categories.txt
    echo "✅ Created: crawled-not-indexed-analysis/categories.txt ($CATEGORIES URLs)"
fi

# Extract user profiles
if [ $USERS -gt 0 ]; then
    grep "/u/" "$CSV_FILE" > crawled-not-indexed-analysis/users.txt
    echo "✅ Created: crawled-not-indexed-analysis/users.txt ($USERS URLs)"
fi

# Extract tags
if [ $TAGS -gt 0 ]; then
    grep "/tag/" "$CSV_FILE" > crawled-not-indexed-analysis/tags.txt
    echo "✅ Created: crawled-not-indexed-analysis/tags.txt ($TAGS URLs)"
fi

echo ""
echo "================================================================================"
echo "  SAMPLE URLs (First 10)"
echo "================================================================================"
tail -n +2 "$CSV_FILE" | head -10

echo ""
echo "================================================================================"
echo "  RECOMMENDATIONS"
echo "================================================================================"
echo ""

if [ $TOPICS -gt 0 ]; then
    echo "📝 TOPICS ($TOPICS URLs):"
    echo "   - Review: crawled-not-indexed-analysis/topics.txt"
    echo "   - Focus on improving high-quality discussion topics"
    echo "   - Merge duplicate/similar topics"
    echo "   - Enhance thin content (add details, images, context)"
    echo ""
fi

if [ $CATEGORIES -gt 0 ]; then
    echo "📁 CATEGORIES ($CATEGORIES URLs):"
    echo "   - Review: crawled-not-indexed-analysis/categories.txt"
    echo "   - Write detailed 200+ word descriptions for each"
    echo "   - Create pinned 'About' topics"
    echo "   - Add category guidelines"
    echo ""
fi

if [ $USERS -gt 0 ]; then
    echo "👤 USER PROFILES ($USERS URLs):"
    echo "   - Review: crawled-not-indexed-analysis/users.txt"
    echo "   - Consider: Should user profiles be indexed?"
    echo "   - Option: Add 'noindex' to user profile pages (normal practice)"
    echo "   - Focus SEO efforts on content, not profiles"
    echo ""
fi

echo "================================================================================"
echo "  NEXT STEPS"
echo "================================================================================"
echo ""
echo "1. Review the filtered files in: crawled-not-indexed-analysis/"
echo "2. Follow: gsc-analysis-and-action-plan/01-admin-quick-start-guide.md"
echo "3. Start with Week 1 tasks in: 02-week-by-week-action-plan.md"
echo "4. Prioritize improving top 20-30 topics first"
echo "5. Monitor progress in Google Search Console weekly"
echo ""
echo "================================================================================"
echo "  Report generated: $(date)"
echo "================================================================================"
