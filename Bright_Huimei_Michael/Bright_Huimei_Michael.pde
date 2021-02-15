/*********************************************************
*  Name: Bright Lin, Huimei Lin, Micheal Ma              *
*  Course: ICS 3U 01  Pd.                                *
*  Assignment #6(summative)                              *
*  Purpose: Creates a variation of the game flappy bird  *
*           with a more complex structure.               *
*  Due Date: May, 24, 2017                               *
*********************************************************/

import java.awt.*;
boolean start = false;
boolean start2 = false;
int screen = 0;
int HighScore = 0;



Bird b;
Bird b2;
Pipe []p;
PowerUp pw = new PowerUp ();
 
PImage background; 

PImage ground; 
PImage topPipes; 
PImage bottomPipes; 
PImage piranha; 
PImage piranha1; 
PImage bird; 
PImage fbird;
PImage powerUpBox;
PImage life;
PImage life2;
PImage smallBird;
PImage smallfbird;
PImage smallBirdUp;
PImage smallfbirdUp;
PImage birdUp; 
PImage fbirdUp;
PImage deadbird;
int s,m;
int s1,m1;
int[] xs = {0,1000,1000,0};
int[] ys = {800, 800, 900, 900};
Polygon g = new Polygon(xs, ys, 4);
int A=0;
int B=0;
int C = 0;
int D = 0;
int score;
int scoreRate;
boolean up = false;
int z = 5;
int draw;
PFont font;
PFont default_font;
PImage redBird;
PImage greenBird;
int Lcount;
void setup()
{
  size(1000,900);
  reset();  
  smallfbird = loadImage ("bird_sing3.png");
  smallBird = loadImage ("bird_sing2.png");
  life = loadImage ("heart.png");
  life2 = loadImage ("heart2.png");
  powerUpBox = loadImage ("PowerUP.png");
  fbird = loadImage ("bird_sing1.png");
  topPipes = loadImage ("tube1.png");
  bottomPipes = loadImage ("tube2.png");
  background = loadImage("bg.jpg");
  bird = loadImage("bird_sing.png");
  piranha = loadImage ("Piranha.png");
  piranha1 = loadImage ("Piranha1.png");
  ground = loadImage("ground.png");
  smallfbirdUp = loadImage ("bird_sing7.png");
  smallBirdUp = loadImage("bird_sing6.png");
  fbirdUp = loadImage("bird_sing5.png");
  birdUp = loadImage("bird_sing4.png");
  deadbird = loadImage("bird_sing8.png");
  font = createFont("04B_19__.TTF", 30);
  redBird= loadImage ("bird_singGREEN.png");
  greenBird = loadImage ("bird_singRED.png");
  default_font = createFont("SansSerif", 30);
}


void draw()
{  
  if (screen == 0)
  {
    reset();
    image(background,0,0);
    image(ground, 0,800);
    stroke(106, 63, 29);
    fill(color(#6A3F1D));
    rect( 175, 410, 150, 80);
    stroke( 245, 230, 150);
    strokeWeight(4);
    fill(color(#EA720E));
    rect( 179, 414, 142, 68);
    fill(255);
    textFont(font, 30);
    text(("START"), 205, 433, 132, 64);
    //start button
    stroke(106, 63, 29);
    fill(color(#6A3F1D));
    rect( 625, 410, 200, 80);
    stroke( 245, 230, 150);
    strokeWeight(4);
    fill(color(#EA720E));
    rect( 629, 414, 192, 68);
    fill(255);
    textSize(25);
    text(("INSTRUCTIONS"), 645, 433, 182, 64);
  }
  if (screen == -1)
  {
    image(background,0,0);
    image(ground, 0,800);
    textFont(default_font, 30);
    text("1 PLAYER INSTRUCTiONS:", 100 , 50, 1000, 64);
    textSize(23);
    text("Tap the key “w” to make the bird fly upwards", 100, 100, 1000, 64);
    text("Crash in to \"?\" to gain a powerup. A icon will appear below your hearts", 100, 150, 1000, 64);
    text("Power ups: red =gain a life, orange = double score, yellow = shrink", 100, 200, 1000, 64);
    text("                  green = invincibility, blue = time slows", 100, 250, 1000, 64);
    textSize(18);
    text("Each powerup lasts 15 seconds, only one powerup can be used at a time", 100, 285, 1000, 64);
    textSize(30);
    text("2 PLAYER INSTRUCTIONS:", 100, 330, 1000, 64);
    textSize(23);
    text("One player can tap the “w” key to control the bird while the other", 100, 380, 800, 64);
    text("can use the key “o”", 100, 430, 1000, 64); 
    text("Power ups: red = gain a life, yellow = shrink, green = invincibility", 100, 480, 1000, 64);
    text("                 purple = laser to shoot other bird, black = ultimate laser", 100, 530, 1000, 64);
    text("  *if a player gets any laser power up (purple or black), press \"f\" to shoot", 100, 580, 1000, 64);
  }
  if (screen == 1)
  {
    image(background,0,0);
    image(ground, 0,800);
    stroke(106, 63, 29);
    fill(color(#6A3F1D));
    rect( 175, 410, 150, 80);
    stroke( 245, 230, 150);
    strokeWeight(4);
    fill(color(#EA720E));
    rect( 179, 414, 142, 68);
    fill(255);
    textFont(font, 30);
    text(("1 PLAYER"), 188, 458);
    //start button
    stroke(106, 63, 29);
    fill(color(#6A3F1D));
    rect( 675, 410, 150, 80);
    stroke( 245, 230, 150);
    strokeWeight(4);
    fill(color(#EA720E));
    rect( 679, 414, 142, 68);
    fill(255);
    text(("2 PLAYER"), 688, 458);
  }
  
  if(screen == 2)
  {
    image (background,0,0);
    if (start)
    {  
      for (int i=0; i<4; i++)
      {
        p[i].update();
        p[i].display();
        p[i].recycle();
        p[i].checkHit();  
      } 
      image (ground,0,800);
      pw.update();
      pw.display();
      pw.collide();
      pw.recycle();
      b.update();
      b.display();
      b.showlives ();
      b.printScore();
      pw.showPower();
      if (g.contains(b.x, b.y + 30))
      {
        println ("stop");
        start = false;
        b.lives = 0;
      }  
  }

  if (start==false)
  { 
  screen = 4;  
  }



}
  
if(screen == 3)
{
image (background,0,0);
     if (start2)
    {      
      for (int i=0; i<4; i++)
      {
        p[i].update();
        p[i].display();
        p[i].recycle();
        p[i].checkHit();
  
      }
        
        image (ground,0,800);
        pw.update();
        pw.display();
        pw.collide();
        pw.recycle();
        b.update();
        b.display();
        b.showlives ();
        b2.update();
        b2.display();
        b2.showlives2 ();
        b.printScore();
        pw.showPower();
        
      if(draw == 0)
      {
        fill(0);
        textSize(25);
        text("Player 1", b.x, 100);
        text("Player 2", b2.x, 100);
      }
     else if(draw == 1)
     {
      fill(0);
      textSize(25);
      text("Player 2", b.x, 100);
      text("Player 1", b2.x, 100);
     }
        
  
        if (g.contains(b.x, b.y + 30))
        {
          println ("stop");
          start2 = false;
          b.lives = 0;
        }
         if (g.contains(b2.x, b2.y + 30))
        {
          println ("stop");
          start2 = false;
          b2.lives = 0;
        }
  
  
  
     }

 if (start2==false)
  { 
  screen = 5;
  
  }
}
  
  
if(screen == 4)//game end
{
 image(background, 0, 0);
 image(ground, 0,800);
 textSize(64);
 stroke(255);
 strokeWeight(2);
 fill(color(#FFA550));
 text("Game Over", 300, 350);
 textSize(40);
 stroke(255);
 fill(#959292);
 text("click to continue", 315, 500);
}
  
if(screen ==5)//game end
{ 
 image(background,0,0);
 image(ground, 0,800);
 textSize(64);
 stroke(255);
 strokeWeight(2);
 fill(color(#FFA550));
 text("Game Over", 300, 350);
 textSize(40);
 stroke(255);
 fill(#959292);
 text("click to continue", 315, 500);
}
  if(screen == 6)
  {
    image(background,0,0);
    image(ground, 0,800);
    stroke(0);
    strokeWeight(3);
    fill(color(#EAD49C));
    rect(350,200, 300, 250);
    stroke(216, 159, 44);
    strokeWeight(2);
    line(355, 205, 355, 445);
    stroke(216, 195, 153);
    line(355, 205, 645, 205);
    stroke(255, 237, 165);
    line(645, 205, 645, 445);
    line(645, 445, 355, 445); 
    textSize(25);
    fill(216, 159, 44);
    text("SCORE", 400, 300);
    fill(0);
    text (score, 415, 340);
    if (score > HighScore)
      HighScore = score;
    fill(216, 159, 44);
    text("BEST", 540, 300);
    fill(0);
    text(HighScore, 555, 340);
    

  }
  if(screen == 7)
  {
    image(background,0,0);
    image(ground, 0,800);
    stroke(0);
    strokeWeight(3);
    fill(color(#EAD49C));
    rect(350,200, 300, 250);
    stroke(216, 159, 44);
    strokeWeight(2);
    line(355, 205, 355, 445);
    stroke(216, 195, 153);
    line(355, 205, 645, 205);
    stroke(255, 237, 165);
    line(645, 205, 645, 445);
    line(645, 445, 355, 445);  
    if(b.lives>b2.lives2)
    {
      textSize(25);
      fill(#641629);
      text("WINNER: 1st Player ", 385, 320);
      text("Winner's Score:" + score, 385,360);
     }
    else if(b2.lives>b.lives)
    {
      textSize(25);
      fill(#641629);
      text("WINNER: 2nd Player ", 385, 320);
      text("Winner's Score:" + (score+2), 385,360);
    }
    else if(0==b.lives)
    {
      textSize(25);
      fill(#641629);
      text("Remake", 425, 320);
      
    }
    
    else
    {
      textSize(25);
      fill(#641629);
      text("WINNER: Tie", 420, 320);
    }
  }
  
}

/*** mouseReleased ************************************
* Purpose: Allows the user to go from one screen to   *
*          another in the form of a simple GUI by     *
*          clicking the mouse                         *
* Parameters: None                                    *
* Returns: None                                       *
******************************************************/

void mouseReleased()
{
  if (screen == -1)
    screen = 0;
  if (screen == 0 && mouseX >= 675 && mouseX <= 825 && mouseY >= 410 && mouseY <= 490)
    screen = -1;
  else if (screen == 0 && mouseX >= 175 && mouseX <= 325 && mouseY >= 410 && mouseY <= 490)
    screen = 1;
  else if (screen == 1 && mouseX >= 175 && mouseX <= 325 && mouseY >= 410 && mouseY <= 490)
    {
      screen = 2;
     start = true;
    }
  else if (screen == 1 && mouseX >= 675 && mouseX <= 825 && mouseY >= 410 && mouseY <= 490)
   {
    screen = 3;
    start2 = true;
    z=7;
    
    draw = (int)random(0,2);
   }
  if(start == false && screen == 2 && b.lives == 0)
    screen = 4;
  else if(start2 == false && screen == 3)
    screen = 5;
  else if(screen == 4)
    screen = 6;
  else if(screen == 5)
    screen = 7;
  
 else if(screen == 6)
    screen = 0;
  else if(screen == 7)
    screen = 0;

}

/*** keyPressed ***************************************
* Purpose: Triggers other methods to make the bird    *
*          jump or shoot a laser when the user presses*
*          a certain key                              *
* Parameters: None                                    *
* Returns: None                                       *
******************************************************/
void keyPressed()
{
if (draw==0)
{  
  if (b.lives>0&&key=='w')
  {
    b.up();
  }
  if (start2 == true)
  {
  if (b2.lives2>0&&key=='o')
  {
    b2.up();
  }
  }
  if (b.lives>0&&pw.laserBeam1==true&&key=='f')
  {
    pw.fire();
    
  }
  if (b.lives>0&&pw.laserBeam2==true&&key=='f')
  {
    pw.fire();
    
  }
}
if (draw==1)
{  
  if (b.lives>0&&key=='o')
  {
    b.up();
  }
  if (start2 == true)
  {
  if (b2.lives2>0&&key=='w')
  {
    b2.up();
  }
  }
  if (b.lives>0&&pw.laserBeam1==true&&key=='f')
  {
    pw.fire();
    
  }
  if (b.lives>0&&pw.laserBeam2==true&&key=='f')
  {
    pw.fire();
    
  }
}

  
}
  
/*** reset ********************************************
* Purpose: Resets the game so that each time a game   *
*          ends when a player die, a new game can be  *
*          started through the menu without ending the* 
*          program                                    *
* Parameters: None                                    *
* Returns: None                                       *
******************************************************/
void reset ()
{

  
  b = new Bird();
  b2 = new Bird();
  b2.x = 680;
  Lcount=0;
  scoreRate =1;
  score=0;
  pw.pw =false;
  pw.pw2 = false;
  p = new Pipe[4];
  z = 5;

  draw = 0;
  
  
  for(int i = 0;i<4;i++)
{
      p[i]=new Pipe(i);
}
  
  
  
}