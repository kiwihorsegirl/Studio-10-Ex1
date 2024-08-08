public class RectangleButton extends Button{
  
    private int _bHeight; 
    private PFont _font;
    private String _caption;
    //
    private int _bWidth;
    
    
    public RectangleButton(int x, int y, String caption, color buttonColor, int bWidth, int bHeight) {
      
     // FIXME
     super(x, y, buttonColor);
     _font = createFont("Arial", 14);
     textFont(_font);
    _bHeight = bHeight;
    _caption = caption;
    //
    _bWidth = bWidth;
  }
  
  public void drawButton() {
    
    //fill(_buttonColor);
    color selectedColor = #FF0303;

    if (_isSelected) {
        fill(selectedColor);
    } else {
        fill(_buttonColor);
    }

   rect(_x, _y, _bWidth, _bHeight);
   fill(0);
   textAlign(CENTER, CENTER);
   text(_caption, _x + _bWidth / 2, _y + _bHeight / 2);
  }
  
  public boolean isClicked(int x, int y) {
    
    float leftX = _x;
    float rightX = _x + _bWidth;
    float topY = _y;
    float bottomY = _y + _bHeight;

    return (x >= leftX && x <= rightX && y >= topY && y <= bottomY);
  }

}
