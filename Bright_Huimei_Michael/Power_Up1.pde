class PowerUp
{
  boolean pw=false;
  boolean pw2=false;
  int x =800;
  int y=400; 
  int dir;
  int speed =2;
  int type = 0;
  boolean laserBeam1;
  boolean laserBeam2;
  int type2 =0;
  void display()
  {
    image (powerUpBox, x,y);
  }
  
  void update()
  {
    dir= (int)random(0,4);
    if (dir==0)
    {
      x-=speed;
      y-=speed;
    }
    if (dir==1)
    {
      x-=speed;
      y+=speed;
    }
  }
 
 
  
  
  
  
  
  
  /*** collide ******************************************
* Purpose: Check to see if bird collides with power up *
* Parameters: None                                    *
* Returns: None                                       *
******************************************************/
  void collide()
  { 
    int [] boxX= {x,x+40,x+40,x};
    int [] boxY= {y,y,y+40,y+40};
    Polygon Box = new Polygon(boxX, boxY, 4);
   if (pw==true)
   { 
     if (type==0)
      {
        if (( m==minute() && s+15<second())|| (s+15==second()+60))
          {
            scoreRate=1; pw=false;
          }
     
      }
       
      if (type==1)
      {
        if (( m==minute() && s+5<second())|| (s+5==second()+60))
          {
            b.invincibility1=false; pw=false; 
          }
     
      }
     
      if (type==2)
      {
        if (( m==minute() && s+1<second())|| (s+1==second()+60))
          {
           B=0; pw=false; 
          }
     
      }
      
      if (type==3)
      {
        if (( m==minute() && s+15<second())|| (s+15==second()+60))
        {
          b.small = false;
          pw=false;
          
        }
     
      }
      
      if (type==4)
      {
        if (( m==minute() && s+10<second())|| (s+10==second()+60))
        {  pw=false;
           for (int i=0; i<4; i++)
          {
            p[i].speed=2;
            p[i].pspeed=2;
          }  
        }
     
      }
      
      if (type==5)
      {
        if (( m==minute() && s+10<second())|| (s+10==second()+60))
        {
          laserBeam1= false; 
          pw=false;
        }
      }
      
      if (type==6)
      {
        if (( m==minute() && s+10<second())|| (s+10==second()+60))
        {
           
          pw=false;
        }
        if (Lcount==1)
        {
           
          laserBeam2=false;
        }
      }
      
    } 
if (pw2==true)
{
      if (type2==0)
      {
        if (( m1==minute() && s1+15<second())|| (s1+15==second()+60))
          {
            scoreRate=1; pw2=false;
          }
     
      }
       
      if (type2==1)
      {
        if (( m1==minute() && s1+5<second())|| (s1+5==second()+60))
          {
            b.invincibility1=false; pw2=false; 
          }
     
      }
     
      if (type2==2)
      {
        if (( m1==minute() && s1+1<second())|| (s1+1==second()+60))
          {
           B=0; pw2=false; 
          }
     
      }
      
      if (type2==3)
      {
        if (( m1==minute() && s1+15<second())|| (s1+15==second()+60))
        {
          b2.small = false;
          pw2=false;
         // small2 = false;
        }
     
      }
      
      if (type2==4)
      {
        if (( m1==minute() && s1+10<second())|| (s1+10==second()+60))
        {  pw2=false;
           for (int i=0; i<4; i++)
          {
            p[i].speed=2;
            p[i].pspeed=2;
          }  
        }
     
      }
      
      if (type2==5)
      {
        if (( m1==minute() && s1+10<second())|| (s1+10==second()+60))
        {
          laserBeam1= false; 
          pw2=false;
        }
     
      } 
   
    
 
 
 
   }
  

  
  
  
  
  
  
  
  //checks time and disables power up after certain amount of time
  //powerups for the first bird
  if (pw==false) 
  {
    type = (int)random (0, z); 
    println (type);
    if (type==0)
    {  
    if (Box.contains (b.x+40, b.y)||Box.contains (b.x+40, b.y+28)||Box.contains (b.x, b.y+28)||Box.contains(b.x, b.y)||Box.contains(b.x+20,b.y+28)||Box.contains(b.x+20,b.y))
    {
             
                   
                   pw=true;
                   DoublePoint();    
                   s = second();
                   m = minute();
              
    }  
                   
 
    if (( m==minute() && s+15<second())|| (s+15==second()+60))
    {
      scoreRate=1; pw=false;
    }
      
                
   }
    
   
   if (type==1)
   {
   if (Box.contains (b.x+40, b.y)||Box.contains (b.x+40, b.y+28)||Box.contains (b.x, b.y+28)||Box.contains(b.x, b.y)||Box.contains(b.x+20,b.y+28)||Box.contains(b.x+20,b.y))
    {
             
                   
                   pw=true; 
                   b.invincibility1=true;    
                   
                   s = second();
                   m = minute();
                   
    }
      
    if (( m==minute() && s+5<second())|| (s+5==second()+60))
    {
      b.invincibility1=false; pw=false;
    }
     
     
   }
 
   if (type==2)
   {
   if (Box.contains (b.x+40, b.y)||Box.contains (b.x+40, b.y+28)||Box.contains (b.x, b.y+28)||Box.contains(b.x, b.y)||Box.contains(b.x+20,b.y+28)||Box.contains(b.x+20,b.y))
    {
           pw=true;
           B++;  
           if (B==1 && b.lives<=2)
           b.lives++;
           s=second();
           m=minute();
    }
      
    if (( m==minute() && s+1<second())|| (s+1==second()+60))
    { B=0; pw=false; }
    
     
     
   }
   
   
   
   
   if (type==3)
   {
   if (Box.contains (b.x+40, b.y)||Box.contains (b.x+40, b.y+28)||Box.contains (b.x, b.y+28)||Box.contains(b.x, b.y)||Box.contains(b.x+20,b.y+28)||Box.contains(b.x+20,b.y))
    {
           pw= true;
           image (smallBird, b.x,b.y);
           b.small=true;
          
           s = second();
           m = minute();
    }
      
    if (( m==minute() && s+15<second())|| (s+15==second()+60))
    {
      b.small = false; 
       
      //small2 = false;
      pw=false; 
    }
    
   } 
    //multiplayer exclusive 
    
   if (type==4)
  {
    if (Box.contains (b.x+40, b.y)||Box.contains (b.x+40, b.y+28)||Box.contains (b.x, b.y+28)||Box.contains(b.x, b.y)||Box.contains(b.x+20,b.y+28)||Box.contains(b.x+20,b.y))
   {  pw=true;
      { for (int i=0; i<4; i++)
           {
            p[i].speed=1;
            p[i].pspeed=1;
           }
             s = second();
             m = minute();
      }
    
   
      
     if (( m==minute() && s+10<second())|| (s+10==second()+60))
      {pw=false;
       for (int i=0; i<4; i++)
        {
          p[i].speed=2;
          p[i].pspeed=2;
        }  
      }
      
      
   }

   
  }
   
    if (type==5)
   {
   if (Box.contains (b.x+40, b.y)||Box.contains (b.x+40, b.y+28)||Box.contains (b.x, b.y+28)||Box.contains(b.x, b.y)||Box.contains(b.x+20,b.y+28)||Box.contains(b.x+20,b.y))
    {
      pw=true;
      laserBeam1=true;
      s = second ();
      m = minute ();
      
    }
      
    if (( m==minute() && s+15<second())|| (s+15==second()+60))
    {
      laserBeam1= false; 
       pw=false;
    }
    

   }
   
   if (type==6)
   {
   if (Box.contains (b.x+40, b.y)||Box.contains (b.x+40, b.y+28)||Box.contains (b.x, b.y+28)||Box.contains(b.x, b.y)||Box.contains(b.x+20,b.y+28)||Box.contains(b.x+20,b.y))
    {
      pw=true;
      laserBeam2=true;
      s = second ();
      m = minute ();
      
    }
      
    if (( m==minute() && s+15<second())|| (s+15==second()+60))
    {
      laserBeam2= false; 
       pw=false;
    }
    

   }
   
   
  
   
 // powerups for the second bird (infront bird)
  }
  if (pw2==false) 
  {
    type2 = (int)random (0, 5);
   
    if (type2==0)
    {  
    if (Box.contains (b2.x+40, b2.y)||Box.contains (b2.x+40, b2.y+28)||Box.contains (b2.x, b2.y+28)||Box.contains(b2.x, b2.y)||Box.contains(b2.x+20,b2.y+28)||Box.contains(b2.x+20,b2.y))
    {
             
                   if (screen ==3)
                   pw2=true;
                   DoublePoint();    
                   s1 = second();
                   m1 = minute();
              
    }  
                   
 
    if (( m1==minute() && s1+15<second())|| (s1+15==second()+60))
    {
      scoreRate=1; pw2=false;
    }
      
                
   }
    
   
   if (type2==1)
   {
   if (Box.contains (b2.x+40, b2.y)||Box.contains (b2.x+40, b2.y+28)||Box.contains (b2.x, b2.y+28)||Box.contains(b2.x, b2.y)||Box.contains(b2.x+20,b2.y+28)||Box.contains(b2.x+20,b2.y))
    {
             
                   if (screen == 3)
                   pw2=true; 
                   b2.invincibility1=true;    
                   
                   s1 = second();
                   m1 = minute();
                   
    }
      
    if (( m1==minute() && s1+5<second())|| (s1+5==second()+60))
    {
      b2.invincibility1=false; pw2=false;
    }
     
     
   }
 
   if (type2==2)
   {
   if (Box.contains (b2.x+40, b2.y)||Box.contains (b2.x+40, b2.y+28)||Box.contains (b2.x, b2.y+28)||Box.contains(b2.x, b2.y)||Box.contains(b2.x+20,b2.y+28)||Box.contains(b2.x+20,b2.y))
    {      if (screen == 3)
           pw2=true;
           D++;  
           if (B==1 && b2.lives<=2)
           b2.lives++;
           s1=second();
           m1=minute();
    }
      
    if (( m1==minute() && s1+1<second())|| (s1+1==second()+60))
    { D=0; pw2=false; }
    
     
     
   }
   
   ////////////////////////////////////////////////////////////
   
   
   if (type2==3)
   {
   if (Box.contains (b2.x+40, b2.y)||Box.contains (b2.x+40, b2.y+28)||Box.contains (b2.x, b2.y+28)||Box.contains(b2.x, b2.y)||Box.contains(b2.x+20,b2.y+28)||Box.contains(b2.x+20,b2.y))
    {
           if (screen == 3)
           pw2= true;
           image (smallBird, b2.x,b2.y);
           b2.small=true;
           
           s1 = second(); 
           m1 = minute();
    }
      
    if (( m1==minute() && s1+15<second())|| (s1+15==second()+60))
    {
      b2.small = false; 
      pw2=false;
  
    }
    
   } 
    //multiplayer exclusive 
    
    
    
  if (type2==4)
  {
    if (Box.contains (b2.x+40, b2.y)||Box.contains (b2.x+40, b2.y+28)||Box.contains (b2.x, b2.y+28)||Box.contains(b2.x, b2.y)||Box.contains(b2.x+20,b2.y+28)||Box.contains(b2.x+20,b2.y))
   {  if (screen == 3)
     pw2=true;
      { for (int i=0; i<4; i++)
           {
            p[i].speed=1;
            p[i].pspeed=1;
           }
             s1 = second();
             m1 = minute();
      }
    
   
      
     if (( m1==minute() && s1+10<second())|| (s1+10==second()+60))
      {pw2=false;
       for (int i=0; i<4; i++)
        {
          p[i].speed=2;
          p[i].pspeed=2;
        }  
      }
      
      
   }

   
  }
  }
 }
    
    
  
  
  
  void DoublePoint()
  {
     
    
    scoreRate=2;
    

  }
  
  
  // shooots lazer
  void fire ()
  {
  if ( laserBeam1==true)
  {
    rect (b.x+10,b.y+14,1000,4); 
    fill (255,0,0);
    if (b.y+22>b2.y-3&& b.y+18<b2.y+40)
    {
      println ("HIT");
     b2.lives2-=1; 
    }
  }
  if (laserBeam2==true)
  { 
    rect (b.x+10,b.y+14,1000,4); 
    fill (128,0,128);
    if (b.y+22>b2.y-3&& b.y+18<b2.y+40)
    {
     println ("HIT");
     b2.lives2=0; 
    }

  }

  }

  
  
  
  
  
  
  
  
  /*** recycle ******************************************
* Purpose: Recycles the powerup icon back into the    *
*          screen after it moves out to continously   *
*          provide powerups for the players to hit    *
* Parameters: None                                    *
* Returns: None                                       *
******************************************************/
  void recycle()
  {
    if (this.x<0 || this.x>1000|| this.y>800 || this.y<0)
    {
     x=1000;
     y=(int)random(1, 600);
    }
  }
  
  /*** showPower ****************************************
* Purpose: Displays a icon of different colours which *
*          corresponds to different powerups          *
*          underneath one's lives' on the top corners *
*          to indicate which powerup is in use.       *
* Parameters: None                                    *
* Returns: None                                       *
******************************************************/
  void showPower ()
  { 
    
    if (pw==true)
    {
      if (type == 0)
      {
        
        fill (#FF9900);
        rect (20, 100, 60, 60);
        image(bird, 30, 115);
      }
      
      else if (type == 1)
      {
        
        fill (#00FF00);
        rect (20, 100, 60, 60);
        image(bird, 30, 115);
      }
      
      else if (type == 2)
      {
        
        fill (#FF0000);
        rect (20, 100, 60, 60);
        image(bird, 30, 115);
      }
      
      else if (type == 3)
      {
        
        fill (#FFFF00);
        rect (20, 100, 60, 60);
        image(bird, 30, 115);
      }
      
      else if (type == 4)
      {
        
        fill (#0000FF);
        rect (20, 100, 60, 60);
        image(bird, 30, 115);
      }
      
      else if (type == 5)
      {
        
        fill (#FF00FF);
        rect (20, 100, 60, 60);
        image(bird, 30, 115);
      }
      
       else if (type == 6)
      {
       
        fill (#000000);
        rect (20, 100, 60, 60);
        image(bird, 30, 115);
      }
    }
    
        if (pw2==true)
    {
      if (type2 == 0)
      {
        
        fill (#FF9900);
        rect (920, 100, 60, 60);
        image(bird, 930, 115);
      }
      
      else if (type2 == 1)
      {
        
        fill (#00FF00);
        rect (920, 100, 60, 60);
        image(bird, 930, 115);
      }
      
      else if (type2 == 2)
      {
        
        fill (#FF0000);
        rect (920, 100, 60, 60);
        image(bird, 930, 115);
      }
      
      else if (type2 == 3)
      {
        
        fill (#FFFF00);
        rect (920, 100, 60, 60);
        image(bird, 930, 115);
      }
      
      else if (type2 == 4)
      {
        
        fill (#0000FF);
        rect (920, 100, 60, 60);
        image(bird, 930, 115);
      }
      
      else if (type2 == 5)
      {
        
        fill (#FF00FF);
        rect (920, 100, 60, 60);
        image(bird, 930, 115);
      }
    }
  }
}