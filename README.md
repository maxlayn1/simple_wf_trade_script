# simple_wf_trade_script
Simple Warframe script to auto type a message in trade chat every two minutes

## Installation
Download 'trade_chat_auto.ahk' and AutoHotkey v2.0+. 
AutoHotkey v2.0+ can be found here: https://www.autohotkey.com

## Usage
Run the file using AutoHotkey once tabbed into a text channel in Warframe. There are a few keybinds to make using the script a bit easier:
- 'CTRL + m' will bring up a prompt to enter a message, which will be repeatedly output every two minutes.
- 'CTRL + j' will start running the script, outputting the default message of 'WTB' if no message is entered.
- 'CTRL + p' will pause the script, stopping output until the keybind is pressed again to resume input.

## Other Notes
- The script will automatically swap to Warframe.x64.exe to enter the output.
  - If your Warframe process name differs from this, you will need to change the script to match this.
- You MUST be clicked into the actual text input field for the script to send messages. (blinking cursor)
