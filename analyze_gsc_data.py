#!/usr/bin/env python3
import pandas as pd
import sys

# Read the Excel file
excel_file = 'gsc-analysis-and-action-plan/sanjal.com-Coverage-2026-01-15.xlsx'

try:
    # Get sheet names
    xls = pd.ExcelFile(excel_file)
    print("=" * 80)
    print("SHEET NAMES IN THE EXCEL FILE:")
    print("=" * 80)
    for i, sheet in enumerate(xls.sheet_names, 1):
        print(f"{i}. {sheet}")
    
    print("\n" + "=" * 80)
    print("ANALYZING EACH SHEET:")
    print("=" * 80)
    
    # Analyze each sheet
    for sheet_name in xls.sheet_names:
        print(f"\n{'=' * 80}")
        print(f"SHEET: {sheet_name}")
        print("=" * 80)
        
        df = pd.read_excel(excel_file, sheet_name=sheet_name)
        
        print(f"\nTotal rows: {len(df)}")
        print(f"\nColumns: {list(df.columns)}")
        
        print(f"\nFirst 5 rows:")
        print(df.head())
        
        # Show value counts for each column
        print(f"\n--- Column Value Distribution ---")
        for col in df.columns:
            unique_count = df[col].nunique()
            print(f"\n{col}: {unique_count} unique values")
            if unique_count <= 20:
                print(df[col].value_counts())
            else:
                print(f"(Too many unique values to display - showing top 10)")
                print(df[col].value_counts().head(10))
        
except Exception as e:
    print(f"Error: {e}")
    sys.exit(1)
