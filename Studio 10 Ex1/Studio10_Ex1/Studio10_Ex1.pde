//Variable used to store the bottom of the graphs
int graphBottom = 0;

//Create a reference variable for the graphing manager
GraphManager g;

//The index position of the graph to display that is stored in the graph manager
//-1 means no graph is selected to display
int index = -1;

void setup()
{
  size(800, 600);
  
  graphBottom = height-500;
  
  //If running on PC uncomment line below
  g = new GraphManager(sketchPath() + "\\data\\", graphBottom);
  
}

void draw()
{
  background(255);
  //Draw the user interface elements of the graph manager
  g.drawUI();
    
  //Check that a data set has been selected
  if (index > -1)
  {
    //Plot the data set that has been selected
    g.plotDataSet(index); 
  }
}

void mousePressed()
{
  //Check which button in the user interface has been clicked on and store the buttons index position 
  index = g.checkButtonClick(mouseX, mouseY);

}

void keyPressed()
{
  //Check if the user presses a key between '1' and '9'
  if (key >= (int)'1' && key <= (int)'9')
  {
    //Work out the correct index position from the ascii value
    index = key - '1';
  }
}
