#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Clear Notifications
# @raycast.mode silent
# @raycast.icon 🔕

osascript <<'EOF'

property closeActionSet : {"Close", "Clear All"}

on closeNotification(elemRef)
    tell application "System Events"
        try
            set theActions to actions of elemRef
            repeat with act in theActions
                if description of act is in closeActionSet then
                    perform act
                    return true
                end if
            end repeat
        end try
    end tell
    return false
end closeNotification

on searchAndCloseNotifications(elemRef)
    tell application "System Events"
        try
            set subElements to UI elements of elemRef
            repeat with subElem in subElements
                if my searchAndCloseNotifications(subElem) then
                    return true
                end if
            end repeat
        end try
        if my closeNotification(elemRef) then
            return true
        end if
    end tell
    return false
end searchAndCloseNotifications

on run
    tell application "System Events"
        if not (exists process "NotificationCenter") then
            return "NotificationCenter process not running"
        end if

        tell process "NotificationCenter"
            if not (exists window "Notification Center") then
                return "Notification Center is not open"
            end if

            set notificationWindow to window "Notification Center"
            set closedCount to 0

            repeat
                try
                    if not my searchAndCloseNotifications(notificationWindow) then
                        exit repeat
                    end if
                    set closedCount to closedCount + 1
                    delay 0.1
                on error errMsg
                    return "Error: " & errMsg
                end try
            end repeat

            if closedCount > 0 then
                return "Cleared notifications"
            else
                return "No notifications to clear"
            end if
        end tell
    end tell
end run

EOF
