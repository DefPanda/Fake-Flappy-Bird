
class Bird 
{
 boolean small;
 float x=180;
 float y= 350;
 float gravity=0.6;
 float velocity;
 boolean death;
 int lives =3;
 int lives2 = 3;
 
 int llives = lives-1;
 boolean invincibility = false;
 boolean invincibility1 = false;
 boolean plus1;
 
/*** display ******************************************
* Purpose: Displays the bird in different flying      *
*          positions, different states, and different *
*          power ups during the game                  *
* Parameters: None                                    *
* Returns: None                                       *
******************************************************/
 void display ()
 {
   if(lives == 0)
   image(deadbird, x, y);
   
   else if(lives2 == 0)
   image(deadbird, x, y);
   else if (small==false)
   { 
     if ((invincibility==true|| invincibility1==true )&&b.lives>0)
     {     
       if(up == true)
       {
         image (birdUp,x,y);
         if (frameCount%3==0)
         image (fbirdUp,x,y);      
       }
       else
       {
         image(fbird, x, y);
         if(frameCount%3==0)
         image(fbird, x, y);
       }
     } 
   else if (up == true)
   image(birdUp, x,y);
   else
   image(bird, x, y);
   }
 
 else if (small==true)
 {
   if ((invincibility==true|| invincibility1==true )&&b.lives>0)
   {
     if(up == true)
     {
     
       image (smallBirdUp,x,y);
       if (frameCount%3==0)
       {
       
       image (smallfbirdUp,x,y); 
       }
     }
     else
     {
       image(smallBird, x, y);
       if(frameCount%3==0)
       {
       
       image(smallfbird, x, y);
       }
     }     
   }
   else if(up == true)
   image(smallBirdUp, x, y);
   else
   image(smallBird, x,y);   
  } 
}
 
/*** showlives ****************************************
* Purpose: Displays the 3 lives of the bird as 3      *
*          hearts on the top left corner of the screen*
*          during the game while updating each time   *
*          the bird dies                              *
* Parameters: None                                    *
* Returns: None                                       *
******************************************************/
 void showlives ()
 {
   if (lives == 3)
   {
     image (life, 20, 20);
     image (life, 100, 20);
     image (life, 180, 20);
   }
   
   else if (lives == 2)
   {
     image (life, 20, 20);
     image (life, 100, 20);
     image (life2, 180, 20);
   }
   
   else if (lives == 1)
   {
     image (life, 20, 20);
     image (life2, 100, 20);
     image (life2, 180, 20);
   }
   
   else  
   {
     image (life2, 20, 20);
     image (life2, 100, 20);
     image (life2, 180, 20);
   }
 }

/*** showlives2 ***************************************
* Purpose: Displays the 3 lives of the bird as 3      *
*          hearts on the top corners of the screen    *
*          during the game while updating each time   *
*          the bird dies                              *
* Parameters: None                                    *
* Returns: None                                       *
******************************************************/
 void showlives2 ()
 {
     if (lives2 == 3)
   {
     image (life, 920, 20);
     image (life, 840, 20);
     image (life, 760, 20);
   }
   
   else if (lives2 == 2)
   {
     image (life, 920, 20);
     image (life, 840, 20);
     image (life2, 760, 20);
   }
   
   else if (lives2 == 1)
   {
     image (life, 920, 20);
     image (life2, 840, 20);
     image (life2, 760, 20);
   }
   
   else  
   {
     image (life2, 920, 20);
     image (life2, 840, 20);
     image (life2, 760, 20);
   }
 
 }
 
/*** update *******************************************
* Purpose: Updates the location of bird               *
* Parameters: None                                    *
* Returns: None                                       *
******************************************************/
 void update() //Gets put into void draw to be updated in a loop
 {
   this.velocity+= this.gravity; //This will create velocity of the upwards motion.
   this.y+= this.velocity; //This will add the velocity.
   if (velocity < 0)
   {
     up = true;
   }
   else
   up = false;
   
   if (this.y > height-15) // if the height is too low, the bird will stop.
   {
     this.y= height-15;
     this.velocity =0;
   }
   
   if (this.y < 0)
   {
     this.y=0;
     this.velocity=0;
   }
   
   
}
 /*** up **********************************************
* Purpose: Makes the bird jump                        *
* Parameters: None                                    *
* Returns: None                                       *
******************************************************/
  
 void up ()
 {
  this.velocity = -12;  
  
  
    
 }
 /*** printScore **************************************
* Purpose: Prints the score of the first bird at the  *
*          centre of the page                         *
* Parameters: None                                    *
* Returns: None                                       *
******************************************************/
 void printScore()
 {
   if(start == true)
   {
   textSize(40);
   fill(color(0));
   text(score  , 500, 300);
   }

 }
  

    
    
 }
  
   
 