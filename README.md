# Prerequisites
  
### Install Python and OpenCOBOLIDE  
- [Python](https://www.python.org/downloads/release/python-2718/)  
- [OpenCOBOLIDE](https://launchpad.net/cobcide/+download)  
  
### Note when installing Python  
Make sure you install the feature "Add python.exe to Path"  
![Note when installing Python](https://github.com/jjsam07/Library-System/blob/main/images/note_when_installing_python.gif)
  
### Before compiling  
Copy clean.bat and make.bat from the batch_files directory to the root of the project directory.  
![Step 1](https://github.com/jjsam07/Library-System/blob/main/images/step1.gif)
  
Open OpenCOBOLIDE. Go to Preferences -> Compiler Tab. Copy the text in `PATH` field and paste it inside `clean.bat` and `make.bat`  
  
*Note: Make sure you include the backward-slash (\\) at the end*
Example:  
Wrong: `D:\\Program Files (x86)\\OpenCobolIDE\\GnuCOBOL\\bin`  
  
Correct: `D:\\Program Files (x86)\\OpenCobolIDE\\GnuCOBOL\\bin\\`  
![Step 2](https://github.com/jjsam07/Library-System/blob/main/images/step2.gif)
  
# Compilation
Just run make.bat (Double-click it or run it in Command Prompt).
If you want to recompile the program, it is always recommended to clean the project directory.

### Cleaning
Just run clean.bat (Double-click it or run it in Command Prompt).