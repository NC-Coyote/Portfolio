/*==========================================
Name: Nate Cottrell
Student ID: 006765987
Class: CSE-4610: Advanced Operating Systems
===============FINAL PROJECT================*/

#ifndef FILESYS_H
#define FILESYS_H

using namespace std;

class Filesys: public Sdisk
{
  public:
  Filesys(string diskName, int numberOfBlocks, int blockSize);
  int fsClose();
  int newFile(string file);
  int rmFile(string file);
  int getFirstBlock(string file);
  int addBlock(string file, string block);
  int delBlock(string file, int blockNumber);
  int readBlock(string file, int blockNumber, string& buffer);
  int writeBlock(string file, int blockNumber, string buffer);
  int nextBlock(string file, int blockNumber);
  vector<string> block(string buffer, int b);
  vector<string> ls();
  
  private:
  int rootSize;               // maximum number of entries in ROOT
  int fatSize;                // number of blocks needed to store the FAT
  vector<string> fileName;    // filenames in ROOT
  vector<int> firstBlock;     // firstblocks in ROOT
  vector<int> fat;            // FAT - number blocks on Sdisk
  int fsSynch();

  void buildFs();
  void readFs();
  bool checkBlock(string file, int blockNumber);
};

#endif