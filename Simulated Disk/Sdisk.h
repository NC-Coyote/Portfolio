/*==========================================
Name: Nate Cottrell
Student ID: 006765987
Class: CSE-4610: Advanced Operating Systems
===============FINAL PROJECT================*/

#ifndef SDISK_H
#define SDISK_H

#include <string>

using namespace std;

// as copied from the class website
class Sdisk
{
  public:
  Sdisk(string diskName, int numberOfBlocks, int blockSize);
  int getBlock(int blockNumber, string& buffer);
  int putBlock(int blockNumber, string buffer);
  int getNumberOfBlocks(); // accessor function
  int getBlockSize(); // accessor function
  
  private :
  string diskName;        // file name of software-disk
  int numberOfBlocks;     // number of blocks on disk
  int blockSize;          // block size in bytes
};

#endif