
void Check_MouseMoveToClick () {
  
  velocityX = mouseX - pmouseX;
  velocityY = mouseY - pmouseY;
  velocityAve = ( velocityX + velocityY ) / 2.0;
  if ( velocityAve > VELOCITY_MAX ) {
    velocityAve = VELOCITY_MAX;
  }
  
 
  if ( abs(velocityAve) > CLICK_THRESHOLD ) {
    
    count++;
    if ( count > CLICK_THRESHOLD_COUNT ) {
      
      isClick = true;
      
    }
    else if ( count > CLICK_THRESHOLD_COUNT + 1 ) {
      
      count = 0;
      isClick = false;
      
    }
    
  }
  else {
    
    count = 0;
    isClick = false;
    
  }
  
}


/* End */
