public class GraphManager {

  private ArrayList<Button> _buttonList;
  private ArrayList<DataSet> _dataSetsList;
  private color[] _colorValues;
  private int _bottom;
  String[] filenames;
  RectangleButton rButton;

  public GraphManager(String folderPath, int bottom) {

    _dataSetsList = new ArrayList<DataSet>();
    _buttonList = new ArrayList<Button>();
    // CHANGE 5 to how many
    _colorValues = new color[5];
    _colorValues[0] = #6549B4;
    _colorValues[1] = #9C3EC1;
    _colorValues[2] = #3EC17C;
    _colorValues[3] = #135383;
    _colorValues[4] = #E5E865;
    _bottom = bottom;
    
    getFileNames(folderPath);
    
    // Then it will go through all the filenames 
    // check this is right V
    int colorIndex = 0;
    int buttonWidth = 170;
    int x = 10;
    int y = 500;
      for (String file : filenames) {
          _dataSetsList.add(new DataSet(file, _colorValues[colorIndex]));

          rButton = new RectangleButton(x, y, file, _colorValues[colorIndex], buttonWidth, 70);
          
          _buttonList.add(rButton);
          colorIndex++;
          x += buttonWidth + 10;
      }
  }

  public void drawUI() {
    for (Button b : _buttonList) {
        b.drawButton();
    }
  }
  
  public int checkButtonClick(int x, int y) {
    for (int i = 0; i < _buttonList.size(); i++) {
        Button button = _buttonList.get(i);
        if (button.isClicked(x, y)) {
            // Set all buttons to not selected
            for (Button b : _buttonList) {
                b.setSelected(false);
            }
            // Set the clicked button as selected
            button.setSelected(true);
            // Return the index of the clicked button
            return i; 
        }
    }
    return -1; // No button clicked
  }

  private String[] getFileNames(String dir) {

        // Create a File object representing the folder
        File folder = new File(dir);
        
        // Check if the folder exists and is a directory
        if (folder.exists() && folder.isDirectory()) {
            // Get list of files in the folder
            File[] files = folder.listFiles();
            if (files != null) {
                // Array to store filenames
                filenames = new String[files.length];
                
                // Extract filenames
                for (int i = 0; i < files.length; i++) {
                    filenames[i] = files[i].getName();
                }
                
                return filenames;
            } else {
                // No files found in the folder
                return new String[0];
            }
        } else {
            // Folder does not exist or is not a directory
            return null;
        }

    }

    public void plotDataSet(int index) {
      
      if (index >= 0 && index < _dataSetsList.size()) {
        DataSet d = _dataSetsList.get(index);
        d.plotDataSet(_bottom);
      }
    }
  }
