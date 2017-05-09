# Linux Basics

  * [What is Linux?](#what-is-linux)
  * [What is the console?](#what-is-the-console)
  * [What are the most important commands for this workshop?](#what-are-the-most-important-commands-for-this-workshop)

## What is Linux?

Linux is a Unix-like computer operating system that runs on many different platforms. Most distributions (i.e. packaged versions) are available for free and are open source. 

## What is the console?

You are working with the console right now - the console provides a way for the computer to send text output to the user, and to receive text input from the user. The user typically enters text with a computer keyboard and reads the output text on a computer monitor. 

## What are the most important commands for this workshop?

### List of useful commands

Try to memorize the following commands:

  * pwd
    * outputs the current directory
  * ls
    * lists the files in your current directory
    * pass some options: e.g. __ls -la__ lists all filles (option __-a__) in long (option __-l__) format!
    * pass an expansion: e.g. __ls s\*__ lists files and directories starting with s 
  * cd
    * changes directory (e.g. "cd /home/workshop-user")
    * __cd ~__ takes you right to your come directory (in your case __/home/workshop_user__)
  * mkdir
    * creates a new directory (e.g. __mkdir newdirectory__)
  * cp
    * copies a file or directory (e.g. __cp test.txt /home/workshop-user/newdirectory__)
  * mv
    * moves a file or directory (e.g. __mv test.txt /home/workshop-user/newdirectory__)

### General tips

If you haven't come across a command or a program, type __man [command_name]__ or __[program_name] --help__ to learn about its use. You could also try __help__ followed by the command in question. E.g. __help cd__ informs you about the use of __cd__ (change directory, see above).
 




