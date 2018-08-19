import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from datetime import datetime, timedelta
import matplotlib.dates as mdates
import matplotlib.ticker as mticker
from mpl_finance import candlestick_ohlc

# Sample data provided from a csv and read in using pandas.
df = pd.read_csv('crypto-markets.csv')

# Transform date to date object.
df['date'] = pd.to_datetime(df['date'], format='%Y-%m-%d') # Format must match csv format.

# Chart for BTC past 12 months (can be adjusted)
rank = 1
months = 12
name = df[df.ranknow == rank].iloc[-1]['name']
filtered_df = df[(df['ranknow'] == rank) & (df['date'] > (max(df['date']) - timedelta(days=30 * months)))]

filtered_df.set_index('date', inplace=True)

# Calculates Simple Moving Avg (20/50/200)
sma20 = filtered_df.close.rolling(20).mean() # Dictates short-term outlook
sma50 = filtered_df.close.rolling(50).mean() # Medium-term outlook
sma200 = filtered_df.close.rolling(200).mean() # Overall trend

sma_plot = pd.DataFrame({'Price': filtered_df.close, 'SMA 20': sma20, 'SMA 50': sma50, 'SMA 200': sma200})

# Labels (Title, x-axis, y-axis)
sma_plot.plot(figsize=(15, 11), legend=True, title=name + " Price with Moving Averages")
plt.xlabel("Date", fontsize='18')
plt.ylabel('Price', fontsize ='18')

plt.gcf().autofmt_xdate() # Auto format
plt.show() # Display gfx
