tab()
{
        osascript -e "
        tell application \"iTerm\"
         tell the first terminal
          set currentSession to current session
          launch session \"Default Session\"
          tell the last session
           write text \"cd $(pwd)\"
           write text \"$*\"
          end tell
          select currentSession
         end tell
        end tell"
}
