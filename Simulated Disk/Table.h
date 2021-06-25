/*==========================================
Name: Nate Cottrell
Student ID: 006765987
Class: CSE-4610: Advanced Operating Systems
===============FINAL PROJECT================*/

#ifndef TABLE_H
#define TABLE_H

class Table : public Filesys
{
  public:
  Table(string diskName, int numberOfBlocks, int blockSize, string flatFile, string indexFile);
  int buildTable(string inputFile);
  int search(string value);
  
  private:
  string flatFile;
  string indexFile;
  int indexSearch(string value);

  int numRec; // number of records
};

#endif