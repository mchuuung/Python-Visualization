[1mdiff --git a/BitcoinVisualization b/BitcoinVisualization[m
[1mindex 05c9d0a..fee0a86 100644[m
[1m--- a/BitcoinVisualization[m
[1m+++ b/BitcoinVisualization[m
[36m@@ -7,12 +7,13 @@[m [mimport matplotlib.dates as mdates[m
 import matplotlib.ticker as mticker[m
 from mpl_finance import candlestick_ohlc[m
 [m
[31m-df = pd.read_csv('crypto-markets.csv') # Sample data provided from a csv and read in using pandas[m
[32m+[m[32m# Sample data provided from a csv and read in using pandas.[m
[32m+[m[32mdf = pd.read_csv('crypto-markets.csv')[m
 [m
[31m-# Transform date to date object[m
[31m-df['date'] = pd.to_datetime(df['date'], format='%Y-%m-%d') # Format matches csv format[m
[32m+[m[32m# Transform date to date object.[m
[32m+[m[32mdf['date'] = pd.to_datetime(df['date'], format='%Y-%m-%d') # Format must match csv format.[m
 [m
[31m-# Moving average chart for BTC past year[m
[32m+[m[32m# Chart for BTC past 12 months (can be adjusted)[m
 rank = 1[m
 months = 12[m
 name = df[df.ranknow == rank].iloc[-1]['name'][m
[36m@@ -20,17 +21,17 @@[m [mfiltered_df = df[(df['ranknow'] == rank) & (df['date'] > (max(df['date']) - time[m
 [m
 filtered_df.set_index('date', inplace=True)[m
 [m
[31m-# Calculates Simple Moving Avg[m
[32m+[m[32m# Calculates Simple Moving Avg (20/50/200)[m
 sma20 = filtered_df.close.rolling(20).mean() # Dictates short-term outlook[m
 sma50 = filtered_df.close.rolling(50).mean() # Medium-term outlook[m
 sma200 = filtered_df.close.rolling(200).mean() # Overall trend[m
 [m
 sma_plot = pd.DataFrame({'Price': filtered_df.close, 'SMA 20': sma20, 'SMA 50': sma50, 'SMA 200': sma200})[m
 [m
[31m-# Labels[m
[32m+[m[32m# Labels (Title, x-axis, y-axis)[m
 sma_plot.plot(figsize=(15, 11), legend=True, title=name + " Price with Moving Averages")[m
 plt.xlabel("Date", fontsize='18')[m
 plt.ylabel('Price', fontsize ='18')[m
 [m
 plt.gcf().autofmt_xdate() # Auto format[m
[31m-plt.show()[m
[32m+[m[32mplt.show() # Display gfx[m
