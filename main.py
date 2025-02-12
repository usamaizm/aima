import ctypes
import time
import subprocess

def compile_module():
    subprocess.run(["gcc", "-shared", "-o", "module.so", "-fPIC", "module.c"])

def load_and_run():
    try:
        lib = ctypes.CDLL("./module.so")
        lib.run()
    except Exception as e:
        print(f"Error loading module: {e}")

if __name__ == "__main__":
    compile_module()  # Ensure module.so is up-to-date
    while True:
        load_and_run()
        time.sleep(5)  # Reload every 5 seconds
