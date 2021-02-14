
class Pipe 
{
  int space;
  int top;
  int bottom;
  int x;
  float speed;
  float pspeed; //piranha's speed
  boolean pchance;
  float chance;
  int pheight; //bot piranha's spawn y
  int pheight1; //top piranha's y
  
/*** Pipe *********************************************
* Purpose:  Creates a pipe  *(Constructor)            *
* Returns: none                                       *
******************************************************/
  Pipe(int i)
   {
   space=250;
   top = (int)random(100,450);
   chance = (int) random (100,450); // Chance of piranha spawn
   bottom = 800- top - space;
   x = 1000+(i*280); 
   speed = 2;
   pspeed=1;
   pheight=800-bottom;
   pheight1=800-bottom-space-100;
   
   }
   
  
   
   
   
/*** display *****************************************
* Purpose: Display the pipe, piranha on the screen    *
* Parameters: None                                    *
* Returns: None                                       *
******************************************************/
   
   void display ()
   {
     
     if (top%2==0 && chance%2==0)
       image(piranha,x, pheight);
     else if (top%2==0 && chance%2!=0)
       image(piranha1, x, pheight1);
       
     
     
     image (topPipes,x, 800-bottom-space-460); 
     
      
     image (bottomPipes,x,800-bottom); 
   }
/*** update *******************************************
* Purpose: Updates the location of the pipe
* Parameters: None                                    *
* Returns: None                                       *
******************************************************/
   void update()
   {
     boolean trueCount = false;
     this.x -= this.speed; // the speed the pipes come at.
     if (screen == 2 && pw.pw2 == false && this.speed ==1 && pw.pw == false)
     {this.speed = 2;
     this.pspeed = 2;
     }
     
     
     if (this.x<400)
     {this.pheight-=this.pspeed;
      this.pheight1+=this.pspeed;
     }
     else if (screen==3&&this.x<900)
     {this.pheight-=this.pspeed;
      this.pheight1+=this.pspeed;
     }
     
     if (this.pheight<=800-bottom-60)
     { 
      this.pspeed=0;
      
     }
     
     if (this.pheight1 >= 800-bottom-space+60)
     {
      this.pspeed=0; 
      
     }
     
     if (trueCount ==false && speed==2 && b.x==x+120)
     {
       score=score+scoreRate;
     
       trueCount = true;
     }
     
     if (trueCount ==false)
     {
       if (b.x==x+121)
       score = score + scoreRate;
      
       
     }
      
      
     
   }
   
/*** checkHit ****************************************
* Purpose: To check if the bird(s) had crashed into   *
*          anything and giving invincibility          *
* Parameters: None                                    *
* Returns: None                                       *
******************************************************/
void checkHit()
{

//top pipe
int [] topPipeX ={x+4, x+120-4, x+120-4, x+120, x+120,x,x, x+4};
int [] topPipeY ={800-bottom-space-460, 800-bottom-space-460, 800-bottom-space-33, 800-bottom-space-33, 800-bottom-space, 800-bottom-space, 800-bottom-space-33, 800-bottom-space-33};

Polygon TopPipe= new Polygon (topPipeX, topPipeY, 8);

//bot pipe
int [] botPipeX ={x,x+120,x+120,x+120-4,x+120-4, x+4, x+4, x};
int [] botPipeY ={800-bottom, 800-bottom, 800-bottom+33, 800-bottom+33, 800, 800, 800-bottom+33, 800-bottom+33};

Polygon BotPipe = new Polygon (botPipeX, botPipeY, 8);

//top Piranha 
int [] topPiranhaX = {x+5, x+14+5, x+43+5, x+86-14+5, x+86, x+43+5};
int [] topPiranhaY = {800-bottom-space+60, 800-bottom-space+60-37, 800-bottom-space+60-46, 800-bottom-space+60-37, 800-bottom-space+60, 800-bottom-space+60-24};

Polygon TopPiranha = new Polygon (topPiranhaX, topPiranhaY, 6);

//bot Piranha 
int [] botPiranhaX = {x+5, x+43+5, x+86+5, x+86-14+5, x+43+5, x+14+5};
int [] botPiranhaY = {800-bottom-60, 800-bottom-60+24, 800-bottom-60, 800-bottom-60+37, 800-bottom-60+46, 800-bottom-60+37};

Polygon BotPiranha = new Polygon (botPiranhaX, botPiranhaY, 6);
if (b.invincibility == false && b.invincibility1==false) 
{
  if(b.small== false || b2.small==false)
  {
  if (top%2==0 && chance%2!=0 && (TopPiranha.contains(b.x+40, b.y)|| TopPiranha.contains (b.x, b.y)))
    { 
      s = second ();
      m = minute ();
      invincible ();
      
    }

  else if (top%2==0 && chance%2==0 && (BotPiranha.contains (b.x+40, b.y+28)|| BotPiranha.contains (b.x,b.y+28)))
    {
      
      invincible ();
      
    }

  else if (BotPipe.contains (b.x+40, b.y+28) || TopPipe.contains (b.x+40, b.y)|| TopPipe.contains (b.x, b.y)|| BotPipe.contains (b.x, b.y+28))
    {
      
      invincible ();
      
    }  
  }
  else if (b2.small)
  {
     if (top%2==0 && chance%2!=0 && (TopPiranha.contains(b.x+20, b.y)|| TopPiranha.contains (b.x, b.y)))
    { 
      s = second ();
      m = minute ();
      invincible ();
      
    }

  else if (top%2==0 && chance%2==0 && (BotPiranha.contains (b.x+20, b.y+14)|| BotPiranha.contains (b.x,b.y+14)))
    {
      
      invincible ();
      
    }

  else if (BotPipe.contains (b.x+20, b.y+14) || TopPipe.contains (b.x+20, b.y)|| TopPipe.contains (b.x, b.y)|| BotPipe.contains (b.x, b.y+14))
    {
      
      invincible ();
      
    }
  }
}
// for multiplayer mode
if(start2 == true)
{
if (b2.invincibility == false && b2.invincibility1==false)
{
  if(b.small== false)
  {
  if (top%2==0 && chance%2!=0 && (TopPiranha.contains(b2.x+40, b2.y)|| TopPiranha.contains (b2.x, b2.y)))
    { 
      s = second ();
      m = minute ();
      invincible2 ();
      
    }

  else if (top%2==0 && chance%2==0 && (BotPiranha.contains (b2.x+40, b2.y+28)|| BotPiranha.contains (b2.x,b2.y+28)))
    {
      
      invincible2 ();
      
    }

  else if (BotPipe.contains (b2.x+40, b2.y+28) || TopPipe.contains (b2.x+40, b2.y)|| TopPipe.contains (b2.x, b2.y)|| BotPipe.contains (b2.x, b2.y+28))
    {
      
      invincible2 ();
      
    }  
  }
  else if (b2.small)
  {
     if (top%2==0 && chance%2!=0 && (TopPiranha.contains(b2.x+20, b2.y)|| TopPiranha.contains (b2.x, b2.y)))
    { 
      s = second ();
      m = minute ();
      invincible2 ();
      
    }

  else if (top%2==0 && chance%2==0 && (BotPiranha.contains (b2.x+20, b2.y+14)|| BotPiranha.contains (b2.x,b2.y+14)))
    {
      
      invincible2 ();
      
    }

  else if (BotPipe.contains (b2.x+20, b2.y+14) || TopPipe.contains (b2.x+20, b2.y)|| TopPipe.contains (b2.x, b2.y)|| BotPipe.contains (b2.x, b2.y+14))
    {
      
      invincible2 ();
      
    }
  }
}
}
//takes away in a few secs
A++;
C++;
if (A >= 700)
      b.invincibility = false;
if (C >= 700)
      b2.invincibility = false;
      
      
}
  /*** recycle ******************************************
* Purpose: Recycles the four pipes so that they come   *
*          back on the other side of the screen at     *
*          random height to simulate a continous stream*
*          of pipes                                    *
* Parameters: None                                     *
* Returns: None                                        *
******************************************************/
   void recycle()  
      {
      if(this.x<=-120)
      {
       x+=(1120);
       space=250;
       top = (int)random(100,450);
       chance = (int) random (100,450);
       bottom = 800- top - space;
       pheight=800-bottom;
       pheight1=800-bottom-space-100;
       pspeed=1;
      } 
   
      }
 
/*** invincible ***************************************
* Purpose: Makes the bird invincible.                 *
* Parameters: None                                    *
* Returns: None                                       *
******************************************************/
  void invincible ()
  {
    
    A=0;
    b.invincibility = true;
    b.lives--;
    
  }

/*** invincible ***************************************
* Purpose: Makes the second invincible                *
* Parameters: None                                    *
* Returns: None                                       *
******************************************************/
  void invincible2 ()
  {
    
    C=0;
    b2.invincibility = true;
    b2.lives2--; 
  }
}