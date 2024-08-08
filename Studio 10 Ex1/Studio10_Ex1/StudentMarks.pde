public class StudentMarks {
  
  private final int DOT_SIZE = 4;
  private final float MAX_MARK = 100;
  private String _id;
  private int _internal;
  private int _exam;
  private color _dotColor;
  
  public StudentMarks(String id, int internal, int exam, color dotColor) {
    
    _id = id;
    _internal = internal;
    _exam = exam;
    _dotColor = dotColor;
  }
  
  public int getInternal() {
    return _internal;
  }
  
  public int getExam() {
    return _exam;
  }
  
  private String padRight(String input, int colWidth) {
    
    int inputLength = input.length();
    int numSpaces = colWidth - inputLength;
    
    for(int i = 1; i <= numSpaces; i++) {
      //padLeft would be 
      //input = " " + input;
      input += " ";
    }
    return input;
  }
  
  public void plotMark(float yPosition) {
    float x = (_internal / MAX_MARK) * width;
    //float y = (height - ((_exam / MAX_MARK) * height));
    //float y = yPosition - ((_exam / MAX_MARK) * (height - yPosition));
    float formHeightMinusYPos = height - yPosition;
    float y = (formHeightMinusYPos - ((_exam / MAX_MARK) * formHeightMinusYPos));
    
    fill(_dotColor);
    ellipseMode(CENTER);
    ellipse(x, y, DOT_SIZE, DOT_SIZE);
  }
  
  public String toString() {
    return padRight(_id, 10) + padRight(str(_internal), 5) + padRight(str(_exam), 5);
  }
}
