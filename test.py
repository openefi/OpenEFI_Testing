import subprocess
result = subprocess.run(['./start.sh'], stdout=subprocess.PIPE)
print(result.stdout)
print(result.stderr)
