boolean threadRunnig = false;
int tempo = 0;
int tmax = 1;

public void delayCalculate() {
  if (threadRunnig) {
    tmax += 5;
    return;
  }


  Thread Thread_msg = new Thread(new Runnable() {
    public void run() {
      noLoop();
      threadRunnig = true;
      while (tempo < tmax) {
        delay(10);
        tempo++;
      }
      calculate();
    }

    void calculate() {
      fractal.calculate(cx, cy, scale);
      img = fractal.getImage();
      tmax = 10;
      threadRunnig = false;
      loop();
    }
  }
  );
  
  Thread_msg.start();
}
