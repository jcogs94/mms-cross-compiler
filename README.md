# MMS Cross Compiler

## Quick Start:

1. Run "installAll.sh" script in the project root
    - This should only need to be run once and should show "mms-cross-compiler" and "mms-single-file-cross-compiler" images listed just before the end of the script
> ``sudo ./installAll.sh``
2. Follow the instructions for compiling based on your needs below

## For compiling with a MAKEFILE:

1. Copy "crossCompile.sh" to your project directory that includes the MAKEFILE (the "crossCompile.sh" script should be in the same place that you would normally run the "make" command in)
> ``cp crossCompile.sh /path/to/dir/with/makefile/crossCompile.sh``
2. Run "crossCompile.sh" script
> ``sudo /path/to/dir/with/makefile/crossCompile.sh``

## For compiling a single file:

1. Run "cd" command into the "single-file" directory
> ``cd single-file``
2. Run "crossCompileFile.sh" script and pass the name of the file you want compiled first and then the name of the output file
> ``sudo ./crossCompileFile.sh test.c testOutput``

## Manually Installing Necessary Dependencies:

1. Run "install.sh" script in project root (should only need to run this once)
2. Run "buildImage.sh" script in project root (for building with "make" files,
   should only need to be run once)
3. Run "single-files/buildImage.sh" script (for building single C files, if
   desired; should only need to be run onces)

### NOTES:

- The "install.sh" only needs to be run once for both MAKEFILE or single file. It does not need to be run for each (if using both). Only the "buildImage.sh" and their respective "crossCompile*.sh" files are different. Each "buildImage.sh" script builds a separate Docker image that can be run later and that image will remain on your machine
- If you want to ensure the two images are built and saved on your machine, run the following command: "docker image ls"
- Once the "install.sh" and "buildImage.sh" scripts have been built, they do not need to be run again. Only the "crossCompile*.sh" script needs to be run
- The script for cross-compiling a single file can also be copied elsewhere, but will still need to be passed the input and output file paths. The script can be modified by removing the "$1" and "$2" lines and replaced with hard-coded paths if desired.
- Compiling with MAKEFILE has not yet been tested and will most likely need more libraries added to the Dockerfile dependancies install
