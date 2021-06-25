/*==========================================
Name: Nate Cottrell
Student ID: 006765987
Class: CSE-4610: Advanced Operating Systems
===============FINAL PROJECT================*/

#include <iostream>
#include <string>
#include <vector>

#include "Sdisk.h"
#include "Filesys.h"
#include "Shell.h"

using namespace std;

Shell::Shell(string diskName, int numberOfBlocks, int blockSize):Filesys(diskName, numberOfBlocks, blockSize){}

int Shell::dir()
{
  vector<string> flist=ls();
  for (int i = 0; i < flist.size(); i++)
  {
    cout << flist[i] << endl;
  }

  return 1;
}

int Shell::add(string file, string buffer)
{
  int code = newFile(file);
  if(code < 1)
  {
    cout << "Shell add ERROR: Sorry it didn't work out.\n";
    return 0;
  }

  if(getFirstBlock(file) > 0)
  {
    vector<string> blocks = block(buffer, getBlockSize());
    for(int i = 0; i < blocks.size(); i++)
    {
      addBlock(file, blocks[i]);
    }
  }
  
  return 1;
}

int Shell::del(string file)
{
  while(getFirstBlock(file) > 0)
  {
    delBlock(file, getFirstBlock(file));
  }

  rmFile(file);
  return 1;
}

int Shell::type(string file)
{
  // read file in to string buffer
  string buffer;
  int block = getFirstBlock(file);
  if(block < 0)
  {
    cout << "Shell type ERROR: No such file.\n";
    return 0;
  }
  else if(block == 0)
  {
    cout << "File is empty.\n";
    return 1;
  }
  else
  {
    while(block != 0)
    {
      string b;
      readBlock(file, block, b);
      buffer += b;
      block = nextBlock(file, block);
    }
  }

  // print out contents of the file
  cout << buffer;
  return 1;
}

int Shell::copy(string file1, string file2)
{
  // create new file 
  newFile(file2);

  // read origin file into string buffer and copy it into destination file
  string buffer;
  int block = getFirstBlock(file1);
  if(block < 0)
  {
    cout << "Shell type ERROR: No such file.\n";
    return 0;
  }
  else if(block == 0)
  {
    cout << "File is empty.\n";
    return 1;
  }
  else
  {
    // read origin file in and put it in the destination file
    while(block != 0)
    {
      string b;
      readBlock(file1, block, b);
      addBlock(file2, b);
      buffer += b;
      block = nextBlock(file1, block);
    }
  }

  return 1;
}