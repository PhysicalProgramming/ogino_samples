
float velocityX = 0;
float velocityY = 0;
float velocityAve = 0;

void Check_MouseMove () {
  
  velocityX = mouseX - pmouseX;
  velocityY = mouseY - pmouseY;
  velocityAve = ( velocityX + velocityY ) / 2.0;

}


/* End */
