# Prerequisites

### Install Python and OpenCobolIDE
- [Python](https://www.python.org/downloads/release/python-2718/)  
- [OpenCobolIDE](https://launchpad.net/cobcide/+download)  
  
### Note when installing Python
Make sure you install the feature "Add python.exe to Path".  
![Note when installing Python](https://github.com/jjsam07/Library-System/blob/main/images/note_when_installing_python.gif)
  
### Before compiling
Copy `clean.bat` and `make.bat` from `batch_files` directory to the root of the project directory.  
![Step 1](https://github.com/jjsam07/Library-System/blob/main/images/step1.gif)
  
Open OpenCobolIDE. Go to Preferences -> Compiler Tab. Copy the text in `PATH` field and paste it inside `clean.bat` and `make.bat`.  
  
*Note: Make sure you include the backslash (`\`) at the end.*  
**Example:**  
&nbsp;&nbsp;&nbsp;&nbsp;Wrong: `C:\Program Files (x86)\OpenCobolIDE\GnuCOBOL` ❌  
&nbsp;&nbsp;&nbsp;&nbsp;Correct: `C:\Program Files (x86)\OpenCobolIDE\GnuCOBOL\` ✔  
  
![Step 2](https://github.com/jjsam07/Library-System/blob/main/images/step2.gif)
  
# Compiling
Just run `make.bat` (Double-click it or run it in Command Prompt). If you want to recompile the program, it is always recommended to *clean* the project directory.  
  
![Compiling](https://github.com/jjsam07/Library-System/blob/main/images/compiling.gif)  
  
# Cleaning
Just run `clean.bat` (Double-click it or run it in Command Prompt).  
  
![Cleaning](https://github.com/jjsam07/Library-System/blob/main/images/cleaning.gif)  
  
# libcob-4.dll was not found
![libcob-4.dll was not found](https://github.com/jjsam07/Library-System/blob/main/images/libcobdll_not_found.png)

If you get this error, you need to add something to the system environment virables.  

![system environment variables](https://github.com/jjsam07/Library-System/blob/main/images/system_environment_variables)