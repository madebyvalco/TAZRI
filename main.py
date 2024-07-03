import win32event
import msvcrt

def main():
    print("[+] Started Mutex")
    mutex = win32event.CreateMutex(None, True, "ROBLOX_singletonMutex")
    msvcrt.getch()
    
if __name__ == "__main__":
    main()
