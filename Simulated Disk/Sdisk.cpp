/*==========================================
Name: Nate Cottrell
Student ID: 006765987
Class: CSE-4610: Advanced Operating Systems
===============FINAL PROJECT================*/

#include <iostream>
#include <fstream>
#include <sstream>

#include "Sdisk.h"

using namespace std;

Sdisk::Sdisk(string diskname, int numberofblocks, int blocksize)
{
  this->diskName = diskname;
  this->numberOfBlocks = numberofblocks;
  this->blockSize = blocksize;

  int totalSize = numberOfBlocks * blockSize;

  fstream diskFile;
  diskFile.open(diskName.c_str(), ios::in);
  if(diskFile.fail())
  {
    diskFile.open(diskName.c_str(), ios::out);
    if(diskFile.fail())
    {
      cout << "Sdisk ERROR: Failed to open disk.\n";
    }
    else
    {
      for (int i = 0; i < numberOfBlocks * blockSize; i++)
      {
        diskFile.put('#');
      }
    }
  }

  diskFile.close();
}

int Sdisk::getBlock(int blockNumber, string &buffer)
{
  fstream diskFile(this->diskName.c_str(), ios::in);

	if (diskFile.fail())
  {
    cout << "Sdisk getBlock ERROR: Failed to open disk.\n";
    return 0;
  }

	diskFile.seekg(blockNumber * this->blockSize);
	buffer = "";

	for (int i = 0; i < this->blockSize; i++)
  {
    buffer += diskFile.get();
  }

	diskFile.close();
	return 1;
}

int Sdisk::putBlock(int blockNumber, string buffer)
{
  fstream diskFile(this->diskName.c_str(), ios::in | ios::out);

	if (diskFile.fail())
  {
    cout << "Sdisk putBlock ERROR: Failed to open disk.\n";
    return 0;
  }

	diskFile.seekg(blockNumber * this->blockSize);

	for (int i = 0; i < buffer.length() && i < this->blockSize; i++)
  {
    diskFile.put(buffer[i]);
  }

	diskFile.close();
	return 1;
}

int Sdisk::getNumberOfBlocks()
{
  return numberOfBlocks;
}

int Sdisk::getBlockSize()
{
  return blockSize;
}