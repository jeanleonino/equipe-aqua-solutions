
import processing.serial.*;
Serial myPort;
Table table;

int numReadings = 500;  
int readingCounter = 0; 
 
String fileName;
String val;
void setup()
{
  String portName = Serial.list()[1]; 
  
  myPort = new Serial(this, portName, 9600);
   
  table.addColumn("id");
  table.addColumn("year");
  table.addColumn("month");
  table.addColumn("day");
  table.addColumn("hour");
  table.addColumn("minute");
  table.addColumn("second");
  table.addColumn("sensor0");
}

void serialEvent(Serial myPort){
  val = myPort.readStringUntil('\n'); 
  if (val!= null) { 
    val = trim(val);
    println(val);
    float sensor[] = float(split(val, ',')); 
   
    TableRow newRow = dataTable.addRow();
    newRow.setInt("id", table.lastRowIndex());
    newRow.setInt("year", year());
    newRow.setInt("month", month());
    newRow.setInt("day", day());
    newRow.setInt("hour", hour());
    newRow.setInt("minute", minute());
    newRow.setInt("second", second());
    
    newRow.setFloat("sensor1", sensor[0]);
    
    readingCounter++;
    
    if (readingCounter % numReadings ==0)
    {
      fileName = str(year()) + str(month()) + str(day()) + str(table.lastRowIndex()); 
      saveTable(table, fileName); 
    }
  }
}

void draw()
{ 

}