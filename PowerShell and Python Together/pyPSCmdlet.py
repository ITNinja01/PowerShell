import subprocess
import time
runningProcess = subprocess.check_output(
    ["powershell", "-Command", "Get-Process"]
    )
print(runningProcess.decode())
time.sleep(5)