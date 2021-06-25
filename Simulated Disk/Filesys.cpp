/*==========================================
Name: Nate Cottrell
Student ID: 006765987
Class: CSE-4610: Advanced Operating Systems
===============FINAL PROJECT================*/

#include <iostream>
#include <string>
#include <vector>
#include <sstream>

#include "Sdisk.h"
#include "Filesys.h"

using namespace std;

Filesys::Filesys(string diskName, int numberOfBlocks, int blockSize):Sdisk(diskName, numberOfBlocks, blockSize)
{
  string buffer;
  int code = getBlock(0, buffer);
  if(code == 0)
  {
    cout << "Filesys ERROR: Bad device.\n";
    return;
  }

  rootSize = getBlockSize() / 10;
  fatSize = (getNumberOfBlocks() * 5) / getBlockSize() + 1;
  getBlock(1, buffer);
  if(buffer[0] == '#')
  {
    // no filesystem, build one
    cout << "\nNo file system found, building ROOT and FAT...\n";
    buildFs();
    fsSynch();
    cout << "File system created.\n";
  }
  else
  {
    // filesystem exists, read it in
    cout << "\nFile system found, reading...\n";
    readFs();
  }
}

void Filesys::buildFs()
{
  // build root
  ostringstream rootStream;
  for(int i = 0; i < rootSize; i++)
  {
    fileName.push_back("xxxx");
    firstBlock.push_back(0);
    rootStream << "xxxx" << " " << 0 << " ";
  }

  string buffer = rootStream.str();
  vector<string> rootBlocks = block(buffer, getBlockSize());
  putBlock(1, rootBlocks[0]);

  // build fat
  ostringstream fatStream;
  fat.push_back(fatSize + 2);
  //fatStream << fatSize + 2 << " ";
  fat.push_back(1);
  //fatStream << 1 << " ";
  for(int i = 0; i < fatSize; i++)
  {
    fat.push_back(1);
    //fatStream << 1 << " ";
  }

  for(int i = fatSize + 2; i < getNumberOfBlocks(); i++)
  {
    fat.push_back(i + 1);
  }

  fat[fat.size() - 1] = 0;

  for(int i = 0; i < fat.size(); i++)
  {
    fatStream << fat[i] << " ";
  }

  string buffer2 = fatStream.str();
  vector<string> fatBlocks = block(buffer2, getBlockSize());
  for(int i = 0; i < fatBlocks.size(); i++)
  {
    putBlock(2 + i, fatBlocks[i]);
  }
}

void Filesys::readFs()
{
  // read in root
  istringstream rootStream;
  string rootBuffer;
  getBlock(1, rootBuffer);
  rootStream.str(rootBuffer);

  for(int i = 0; i < rootSize; i++)
  {
    string s;
    int t;
    rootStream >> s >> t;
    fileName.push_back(s);
    firstBlock.push_back(t);
  }

  // read in FAT
  string buffer;
  istringstream fatStream;
  for(int i = 0; i < fatSize; i++)
  {
    string b;
    getBlock(i + 2, b);
    buffer += b;
  }

  fatStream.str(buffer);
  for(int i = 0; i < getNumberOfBlocks(); i++)
  {
    int t;
    fatStream >> t;
    fat.push_back(t);
  }
}

int Filesys::fsSynch()
{ // write root and FAT to disk
  // write root
  ostringstream rootStream;
  for(int i = 0; i < rootSize; i++)
  {
    rootStream << fileName[i] << " " << firstBlock[i] << " ";
  }

  string buffer = rootStream.str();
  vector<string> rootBlocks = block(buffer, getBlockSize());
  putBlock(1, rootBlocks[0]);

  // write FAT
  ostringstream fatStream;
  for(int i = 0; i < fat.size(); i++)
  {
    fatStream << fat[i] << " ";
  }

  string buffer2 = fatStream.str();
  vector<string> fatBlocks = block(buffer2, getBlockSize());
  for(int i = 0; i < fatBlocks.size(); i++)
  {
    putBlock(2 + i, fatBlocks[i]);
  }

  return 1;
}

int Filesys::fsClose()
{
  fsSynch();
  return 1;
}

int Filesys::newFile(string file)
{
  // returns 1 if successfull, 0 if it fails
  // check if file exists
  for(int i = 0; i < fileName.size(); i++)
  {
    if(fileName[i] == file)
    {
      cout << "Filesys newFile ERROR: File already exists.\n";
      return 0;
    } 
  }

  // if file doesn't exist, create it and update Sdisk
  for(int i = 0; i < fileName.size(); i++)
  {
    if(fileName[i] == "xxxx")
    {
      fileName[i] = file;
      firstBlock[i] = 0;
      fsSynch();
      return 1;
    }
  }

  cout << "Filesys newFile ERROR: No room in root.\n";
  return 0;
}

int Filesys::rmFile(string file)
{
  // returns 0 if file doesn't exist
  // returns -1 if file is not empty
  // returns 1 if successful
  if(getFirstBlock(file) == -1)
  {
    cout << "Filesys rmFile ERROR: File doesn't exist.\n";
    return 0;
  }
  else if(getFirstBlock(file) > 0)
  {
    cout << "Filesys rmFile ERROR: File is not empty.\n";
    return -1;
  }
  else
  {
    for(int i = 0; i < fileName.size(); i++)
    {
      if(fileName[i] == file)
      {
        fileName[i] = "xxxx";
        fsSynch();
      }
    }
    return 1;
  }
}

int Filesys::getFirstBlock(string file)
{
  // returns first block of file
  // returns 0 if file is empty
  // returns -1 if file doesn't exist

  for(int i = 0; i < fileName.size(); i++)
  {
    if(fileName[i] == file)
    {
      return firstBlock[i];
    }
  }

  cout << "Filesys getFirstBlock ERROR: File doesn't exist.\n";
  return -1;
}

int Filesys::addBlock(string file, string block)
{
  // return allocated block number
  if(block.length() != getBlockSize())
  {
    cout << "Filesys addBlock ERROR: Bad block.\n";
    return 0;
  }

  int first = getFirstBlock(file);
  if(first == -1)
  {
    cout << "Filesys addBlock ERROR: File does't exist.\n";
    return 0;
  }

  int allocate = fat[0];
  fat[0] = fat[fat[0]];
  fat[allocate] = 0;

  if(first == 0)
  {
    for(int i = 0; i < fileName.size(); i++)
    {
      if(fileName[i] == file)
      {
        firstBlock[i] = allocate;
      }
    }
  }
  else
  {
    int b = first;
    while(fat[b] != 0)
    {
      b = fat[b];
    }
    fat[b] = allocate;
  }

  fsSynch();
  putBlock(allocate, block);
  return allocate;
}

int Filesys::delBlock(string file, int blockNumber)
{
  if(!checkBlock(file, blockNumber))
  {
    return 0;
  }

  int b = getFirstBlock(file);
  if(blockNumber == b)
  {
    for(int i  = 0; i < fileName.size(); i++)
    {
      if(fileName[i] == file)
      {
        firstBlock[i] = fat[blockNumber];
        break;
      }
    }
  }
  else
  {
    while(fat[b] != blockNumber)
    {
      b = fat[b];
    }
    fat[b] = fat[blockNumber];
  }

  // update the free list
  fat[blockNumber] = fat[0];
  fat[0] = blockNumber;

  return 1;
}

bool Filesys::checkBlock(string file, int blockNumber)
{
  int b = getFirstBlock(file);
  if(b == -1)
  {
    return false;
  }
  if(b == blockNumber)
  {
    return true;
  }

  while(fat[b] != 0)
  {
    if(fat[b] == blockNumber)
    {
      return true;
    }

    b = fat[b];
  }

  return false;
}

int Filesys::readBlock(string file, int blockNumber, string &buffer)
{
  // return 1 if successful, return 0 if failed
  if(checkBlock(file, blockNumber))
  {
    getBlock(blockNumber, buffer);
    return 1;
  }
  else
  {
    return 0;
  }
}

int Filesys::writeBlock(string file, int blockNumber, string buffer)
{
  // return 1 if successful, return 0 if failed
  if(checkBlock(file, blockNumber))
  {
    putBlock(blockNumber, buffer);
    return 1;
  }
  else
  {
    return 0;
  }
}

int Filesys::nextBlock(string file, int blockNumber)
{
  // returns following blockNumber of file
  if(checkBlock(file, blockNumber))
  {
    return fat[blockNumber];
  }
  else
  {
    return 0;
  }
}

vector<string> Filesys::block(string buffer, int b)
{
  // blocks the buffer into a list of blocks of size b
  vector<string> blocks;
  int numberofblocks = 0;

  if (buffer.length() % b == 0) 
  {
    numberofblocks = buffer.length() / b;
  }
  else 
  {
    numberofblocks = buffer.length() / b + 1;
  }

  string tempblock;
  for (int i = 0; i < numberofblocks; i++)
  {
    tempblock = buffer.substr(b * i, b);
    blocks.push_back(tempblock);
  }

  int lastblock = blocks.size() - 1;

  for (int i = blocks[lastblock].length(); i < b; i++)
  {
    blocks[lastblock] += "#";
  }

  return blocks;
}

vector<string> Filesys::ls()
{
  vector<string> flist;
  for (int i=0; i<fileName.size(); i++)
  {
    if (fileName[i] != "xxxx")
    {
      flist.push_back(fileName[i]);
    }
  }
  
  return flist;
}