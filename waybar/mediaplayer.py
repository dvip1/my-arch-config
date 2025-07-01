#!/usr/bin/env python3
import subprocess
import json
import sys

def get_player_info():
    try:
        # Get player status using playerctl
        status = subprocess.check_output(['playerctl', 'status'], stderr=subprocess.DEVNULL).decode('utf-8').strip()
        
        if status == 'Playing':
            # Get metadata
            artist = subprocess.check_output(['playerctl', 'metadata', 'artist'], stderr=subprocess.DEVNULL).decode('utf-8').strip()
            title = subprocess.check_output(['playerctl', 'metadata', 'title'], stderr=subprocess.DEVNULL).decode('utf-8').strip()
            player = subprocess.check_output(['playerctl', 'metadata', 'mpris:identity'], stderr=subprocess.DEVNULL).decode('utf-8').strip()
            
            # Format output
            if artist and title:
                text = f"{artist} - {title}"
            elif title:
                text = title
            else:
                text = "Playing"
                
            # Determine icon based on player
            if 'spotify' in player.lower():
                icon = 'spotify'
            else:
                icon = 'default'
                
            output = {
                "text": text,
                "class": "playing",
                "tooltip": f"{player}: {text}"
            }
            
        elif status == 'Paused':
            output = {
                "text": "Paused",
                "class": "paused",
                "tooltip": "Media paused"
            }
        else:
            output = {
                "text": "",
                "class": "stopped"
            }
            
    except (subprocess.CalledProcessError, FileNotFoundError):
        output = {
            "text": "",
            "class": "stopped"
        }
    
    print(json.dumps(output))

if __name__ == "__main__":
    get_player_info()
