import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

df = pd.read_csv('9NRcVjanTXaG4teQ7YhPSg_6569a379e88a4510822ca2e960ff61a1_911.csv')

top10_zip = df['zip'].value_counts().head(10)
print("--- Q1: Top 10 Zipcodes ---")
print(top10_zip)
print("Is 19446 present?", 19446.0 in top10_zip.index)
print("Is 19090 present?", 19090.0 in top10_zip.index)

top4_twp = df['twp'].value_counts().head(4)
print("\n--- Q2: Top 4 Townships ---")
print(top4_twp)
candidates = ['LOWER POTTSGROVE', 'NORRISTOWN', 'HORSHAM', 'ABINGTON']
missing_in_top4 = [twp for twp in candidates if twp not in top4_twp.index]
print("Not in top 4:", missing_in_top4)

df['Reason'] = df['title'].apply(lambda title: title.split(':')[0])
reason_counts = df['Reason'].value_counts()
print("\n--- Q3: Reason Counts ---")
print(reason_counts)

plt.figure(figsize=(8,4))
reason_counts.plot(kind='bar')
plt.title('911 Calls by Reason')
plt.xlabel('Reason')
plt.ylabel('Count')
plt.tight_layout()
plt.savefig('reason_barchart.png')
plt.close()

plt.figure(figsize=(8,4))
reason_counts.plot(kind='barh')
plt.title('911 Calls by Reason (Horizontal)')
plt.ylabel('Reason')
plt.xlabel('Count')
plt.tight_layout()
plt.savefig('reason_barchart_horizontal.png')
plt.close()

df['timeStamp'] = pd.to_datetime(df['timeStamp'])
df['Day of Week'] = df['timeStamp'].dt.dayofweek
dmap = {0:'Mon', 1:'Tue', 2:'Wed', 3:'Thu', 4:'Fri', 5:'Sat', 6:'Sun'}
df['Day of Week'] = df['Day of Week'].map(dmap)

ems_by_day = df[df['Reason'] == 'EMS']['Day of Week'].value_counts()
print("\n--- Q5: EMS calls by Day ---")
print(ems_by_day)

plt.figure(figsize=(10,6))
sns.countplot(x='Day of Week', data=df, hue='Reason', palette='viridis')
plt.title('911 Calls by Day of Week and Reason')
plt.legend(bbox_to_anchor=(1.05, 1), loc=2, borderaxespad=0.)
plt.tight_layout()
plt.savefig('day_of_week_countplot.png')
plt.close()

traffic_by_day = df[df['Reason'] == 'Traffic']['Day of Week'].value_counts()
print("\n--- Q6: Traffic calls by Day ---")
print(traffic_by_day)

df['Month'] = df['timeStamp'].dt.month
plt.figure(figsize=(10,6))
sns.countplot(x='Month', data=df, hue='Reason', palette='viridis')
plt.title('911 Calls by Month and Reason')
plt.legend(bbox_to_anchor=(1.05, 1), loc=2, borderaxespad=0.)
plt.tight_layout()
plt.savefig('month_countplot.png')
plt.close()

fire_by_month = df[df['Reason'] == 'Fire']['Month'].value_counts()
print("\n--- Q7: Fire calls by Month ---")
print(fire_by_month)
