# Not implemented
isdatevalid, isleapyear, isnamevalid

# How to compile in Windows with OpenCOBOLIDE
Because OpenCOBOLIDE comes packaged with mingw,
we can use ming32-make to automate our build process
(just like in linux (GNU/Linux)).

## Compilation
### Step 1
Open OpenCOBOLIDE. Go to Preferences -> "Compiler" Tab.  
Copy batch_files/make.bat to project root directory.  
Open make.bat in notepad (Right-click -> Edit).

![step 1](https://github.com/jjsam07/Library-System/blob/main/images/step1.png)
### Step 2
Paste your corresponding path from OpenCOBOLIDE settings to make.bat.
![step 2](https://github.com/jjsam07/Library-System/blob/main/images/step2.png)

Save make.bat and double-click make.bat to run it (you can run it also in cmd).

## Clean-up

To clean up the project directory for a fresh build, do the same as step 1 and 2  
in Compilation. But instead of doing it with make.bat, do it with clean.bat.  
Save clean.bat and double-click clean.bat to run it (you can run it also in cmd).