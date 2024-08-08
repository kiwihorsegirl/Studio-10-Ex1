public class DataSet {
  
  ArrayList<StudentMarks> _studentMarksList;
  private color _dataSetColor;
  String _name = "";
  
  public DataSet(String filename, color dataSetColor) {
    
    String id = "";
    
    String[] fileNameArray = split(filename, '.');
    _name = fileNameArray[0];
    
    int internal = 0;
    int exam = 0;

    _studentMarksList = new ArrayList<StudentMarks>();
    _dataSetColor = dataSetColor;
    
    String[] lineArray = loadStrings(filename);
    for (String l : lineArray) {
      String[] csvArray = split(l, ',');
      id = csvArray[0];
      internal = parseInt(csvArray[1]);
      exam = parseInt(csvArray[2]);
      
      _studentMarksList.add(new StudentMarks(id, internal, exam, _dataSetColor));
    }
  }
  
  public void plotDataSet(float yPosition) {
    noStroke();
    for (StudentMarks m : _studentMarksList) {
      m.plotMark(yPosition);
    }
  }
  
  public void displayDataSet() {
    
    for (StudentMarks m : _studentMarksList) {
      println(m);
    }
  }
  
  public int getAverageInternal() {
    int totalInternal = 0;
    for (StudentMarks m : _studentMarksList) {
      totalInternal += m.getInternal();
    }
    return totalInternal / _studentMarksList.size();
  }
  
  public int getAverageExam() {
   int totalExam = 0;
    for (StudentMarks m : _studentMarksList) {
      totalExam += m.getExam();
    }
    return totalExam / _studentMarksList.size();
  }
  
  public String getName() {
   return _name; 
  }
}
