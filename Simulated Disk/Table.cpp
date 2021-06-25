/*==========================================
Name: Nate Cottrell
Student ID: 006765987
Class: CSE-4610: Advanced Operating Systems
===============FINAL PROJECT================*/

#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include <sstream>

#include "Sdisk.h"
#include "Filesys.h"
#include "Table.h"

using namespace std;

Table::Table(string diskName, int numberOfBlocks, int blockSize, string flatFile, string indexFile):Filesys(diskName, numberOfBlocks, blockSize)
{
  this->flatFile = flatFile;
  this->indexFile = indexFile;
  numRec = 0;

  newFile(flatFile);
  newFile(indexFile);
}

int Table::buildTable(string inputFile)
{
  ostringstream indexStream;
  ifstream infile;
  infile.open(inputFile.c_str());

  if(infile.bad())
  {
    cout << "Table buidlTable ERROR: Cannot open file.\n";
    return 0;
  }

  string s;
  getline(infile, s);
  while(infile.good())
  {
    // process the line, write record to the flat file, then add the index record
    string key = s.substr(0, 5);
    vector<string> blocks = block(s, getBlockSize());
    int b = addBlock(flatFile, blocks[0]);
    indexStream << key << " " << b << " ";
    numRec++;

    getline(infile, s);
  }

  // process the index file
  string buffer = indexStream.str();
  vector<string> blocks = block(buffer, getBlockSize());
  for(int i = 0; i < blocks.size(); i++)
  {
    int b = addBlock(indexFile, blocks[i]);
  }

  return 1;
}

int Table::search(string value)
{
  int b = indexSearch(value);
  if(b <= 0)
  {
    cout << "Table search ERROR: Cannot find block.\n";
    return -1;
  }

  string buffer;
  b = readBlock(flatFile, b, buffer);
  cout << buffer << "\n";

  return b;
}

int Table::indexSearch(string value)
{
  istringstream inStream;
  string bigBuffer;
  int b = getFirstBlock(indexFile);
  if(b <= 0)
  {
    cout << "Table indexSearch ERROR: Unable to find block number.\n";
    return 0;
  }

  while(b != 0)
  {
    string buffer;
    int error = readBlock(indexFile, b, buffer);
    bigBuffer += buffer;
    b = nextBlock(indexFile, b);
  }
  // index file is now a string in bigBuffer

  // process bigBuffer
  inStream.str(bigBuffer);
  for(int i = 0; i < numRec; i++)
  {
    string key;
    int block;
    inStream >> key >> block;
    
    if(key == value)
    {
      return block;
    }
  }

  cout << "Table indexSearch ERROR: Key not found.\n";
  return -100000;
} // end indexSearch