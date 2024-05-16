# import the pandas & seaborn after install them 
# call the google api clint after import

from googleapiclient.discovery import build 
import pandas as pd
import seaborn as sns


# Enter your api key under the api_key variable 
# api_key = ''
channel_name = 'mazajofficial',

youtube = build('youtube', 'v3', developerKey=api_key)

#### this is the youtube function that is avaliable by the youtube it self to pull the request

def get_channel_id(youtube, channel_name):
    try:
        request = youtube.search().list(
            part='snippet',
            q=channel_name,
            type='channel'
        )
        response = request.execute()
        
        if response['items']:
            channel_id = response['items'][0]['snippet']['channelId']
            return channel_id
        else:
            print("No channel found with the name '{}'.".format(channel_name))
            return None
    except HttpError as e:
        print("Error retrieving channel ID for '{}': {}".format(channel_name, e))
        return None
    
####

channel_id = get_channel_id(youtube, channel_name)

if channel_id:
    print("Channel ID for '{}': {}".format(channel_name, channel_id))


