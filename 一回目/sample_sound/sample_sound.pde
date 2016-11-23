import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
 
Minim minim;  //Minim型変数であるminimの宣言
AudioInput in;  //マイク入力用の変数
int waveH = 100;  //波形の高さ
int pointCount = 512; 
float freq = 1;
float phi = 0;
float angle = 0;
 
void setup()
{
  size(600, 600);
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
}
 
void draw()
{
  background(0);
  stroke(255);
  
  for(int i = 0; i < in.bufferSize()-1; i++)
  {
    point(i, 50 + in.left.get(i)*waveH);  
    point(i, 150 + in.right.get(i)*waveH);
  }
  //beginShape();
  //for(int i = 0; i < in.bufferSize()-1; i++)
  //{
  //  angle = map(i, 0, pointCount, 0, TWO_PI);
    
  //  float noise_r = in.right.get(i)*waveH;
  //  float noise_l = in.right.get(i)*waveH;
    
  //  if(i <= in.bufferSize() / 4){
  //    noise_l *= 1;
  //    noise_r *= 1;
  //  }else if(i >= in.bufferSize() / 4 && i <= in.bufferSize() * 2 / 4){
  //    noise_r *= 1;
  //    noise_l *= -1;
  //  }else if(i >= in.bufferSize() * 2 / 4 && i <= in.bufferSize() * 3 / 4){
  //    noise_r *= -1;
  //    noise_l *= -1;
  //  } else {
  //    noise_r *= -1;
  //    noise_l *= 1;
  //  }
    
  //  vertex(width/2 + sin(angle * freq + radians(phi)) * 100 + noise_r , height/2 + cos(angle * freq + radians(phi)) * 100 + noise_l);  //左の音声の波形を画面上に描く
  //}
  //endShape();
}
 
void stop()
{
  in.close();
  minim.stop();
 
  super.stop();
}