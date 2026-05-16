!macro customInit
  DetailPrint "Stopping running Claw in the Box processes..."
  nsExec::ExecToLog 'taskkill /IM "FoxInTheBox.exe" /F /T'
  nsExec::ExecToLog 'taskkill /IM "Claw in the Box.exe" /F /T'
  nsExec::ExecToLog 'taskkill /IM "claw-in-the-box.exe" /F /T'
  Sleep 1000
!macroend

; Keep value name in sync with packages/electron/src/windows-run-once.js (VALUE_NAME).
!macro customUnInstall
  DeleteRegValue HKCU "Software\Microsoft\Windows\CurrentVersion\RunOnce" "FoxInTheBoxResumeSetup"
!macroend
