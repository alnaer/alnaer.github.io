from googleapiclient.discovery import build 
import pandas as pd
import seaborn as sns

# import the pandas and seaborn and google api client
# Enter your own api key
# those are example of the ids you can use any channels ids you want 
# don't use more than 40 IDs at time 
api_key = ''
channel_ids = ['UCNvYCW3cMbkWy2g2v4Wb6xw',
'UChOPyo-uWLVi5uO53mSBX-w',
'UC3WI3Ut8Hvc6kzlLcG0IJHw',
'UCKUOmGXE9Ytlc2EzpGqimtw',
'UCIrgpHvUm1FMtv-C1xwkJtw',
'UC4EZCPioFvzmz0K5zSZAAtA',
'UC6kMgNWdqXlq8ut-XWoANhw',
'UCuM3oV2U0AwbWAQcTSHUC_Q'

 ]
youtube = build('youtube', 'v3', developerKey=api_key)


########################################
# simple request code to request the data from the id and output it in readable format 
# have in mind this code is only get the (channel name & total subscribers & total views & total videos)
 
def get_channel_stats(youtube, channel_ids):
    all_data = []  # Define the list to store all channel data
    request = youtube.channels().list(
                part='snippet,contentDetails,statistics',
                id=','.join(channel_ids))
    response = request.execute()
    
    for i in range (len(response['items'])):
        data = dict(Channel_name = response['items'][i]['snippet']['title'],
               Subscribers = response['items'][i]['statistics']['subscriberCount'],
               Views = response['items'][i]['statistics']['viewCount'],
               Total_videos = response['items'][i]['statistics']['videoCount'])
        all_data.append(data)
       
   
    return all_data