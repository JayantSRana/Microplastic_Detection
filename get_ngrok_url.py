#!/usr/bin/env python
"""
get_ngrok_url.py - Query ngrok API for current public URLs
Run this after starting ngrok to get the public URLs to share
"""
import requests
import json

def get_ngrok_urls():
    try:
        r = requests.get("http://localhost:4040/api/tunnels", timeout=2)
        tunnels = r.json()["tunnels"]
        
        print("\n" + "=" * 50)
        print("   YOUR MICROSCAN AI PUBLIC URLs")
        print("=" * 50)
        for t in tunnels:
            print(f"  {t['name']:12} → {t['public_url']}")
        print("-" * 50)
        print("  Share the 'frontend' URL with your examiner")
        print("=" * 50 + "\n")
        return tunnels
    except requests.exceptions.ConnectionError:
        print("\n[ERROR] ngrok is not running. Start it with: ngrok start --all\n")
        return None
    except Exception as e:
        print(f"\n[ERROR] Could not fetch ngrok URLs: {e}\n")
        return None

if __name__ == "__main__":
    get_ngrok_urls()