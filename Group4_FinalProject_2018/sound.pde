Minim minim_2 = new Minim(this);
AudioPlayer player_2;
AudioInput input;
String filePath = "C:/Users/Kian/Documents/UTS - Copy/Year 4/Spring Sem/Interactive Media/Mark Tree Prototype - Leap Motion Interaction - Kian Southgate/Sound Clips/Final Clips WAV/";

void sound(int i) {
  //println(i);
  
  
  if (i == 0) {
    //file
    String audioFile=filePath + (i+1) + ".wav";
    SamplePlayer player= new SamplePlayer(ac, SampleManager.sample(audioFile));
    //Audio settings
    //Pitch of the sound
    Envelope rate=new Envelope(ac, 0.5);
    player.setRate(rate);
    //Buffer of the sound
    //Creates echo sound effect when interacted
    TapIn in = new TapIn(ac, 1000);
    TapOut out = new TapOut(ac, in, 150);
    beads.Gain gDelay = new beads.Gain(ac, 2, 0.8);
    gDelay.addInput(out);
    in.addInput(gDelay);
    in.addInput(player);


    //output player
    Panner p=new Panner(ac, 2);
    beads.Gain g=new beads.Gain (ac, 2, 0.5);
    g.addInput(p);
    g.addInput(player);
    p.addInput(out);
    ac.out.addInput(g);
    ac.start();
  } else

    if (i == 1) {

      String audioFile=filePath + (i+1) + ".wav";
      SamplePlayer player= new SamplePlayer(ac, SampleManager.sample(audioFile));
      Envelope rate=new Envelope(ac, 0.5);
      player.setRate(rate);
      TapIn in = new TapIn(ac, 1000);
      TapOut out = new TapOut(ac, in, 150);
      beads.Gain gDelay = new beads.Gain(ac, 2, 0.8);
      gDelay.addInput(out);
      in.addInput(gDelay);
      in.addInput(player);



      Panner p=new Panner(ac, 2);
      beads.Gain g=new beads.Gain (ac, 2, 0.5);
      g.addInput(p);
      g.addInput(player);
      p.addInput(out);
      ac.out.addInput(g);
      ac.start();
    } else

      if (i == 2) {
        String audioFile=filePath + (i+1) + ".wav";
        SamplePlayer player= new SamplePlayer(ac, SampleManager.sample(audioFile));
        Envelope rate=new Envelope(ac, 0.5);
        player.setRate(rate);
        TapIn in = new TapIn(ac, 1000);
        TapOut out = new TapOut(ac, in, 150);
        beads.Gain gDelay = new beads.Gain(ac, 2, 0.8);
        gDelay.addInput(out);
        in.addInput(gDelay);
        in.addInput(player);


        Panner p=new Panner(ac, 2);
        beads.Gain g=new beads.Gain (ac, 2, 0.5);
        g.addInput(p);
        g.addInput(player);
        p.addInput(out);
        ac.out.addInput(g);
        ac.start();
      } else

        if (i == 3) {
          String audioFile=filePath + (i+1) + ".wav";
          SamplePlayer player= new SamplePlayer(ac, SampleManager.sample(audioFile));
          Envelope rate=new Envelope(ac, 0.5);
          player.setRate(rate);
          TapIn in = new TapIn(ac, 1000);
          TapOut out = new TapOut(ac, in, 150);
          beads.Gain gDelay = new beads.Gain(ac, 2, 0.8);
          gDelay.addInput(out);
          in.addInput(gDelay);
          in.addInput(player);

          Panner p=new Panner(ac, 2);
          beads.Gain g=new beads.Gain (ac, 2, 0.5);
          g.addInput(p);
          g.addInput(player);
          p.addInput(out);
          ac.out.addInput(g);
          ac.start();
        } else

          if (i==4) {
            String audioFile=filePath + (i+1) + ".wav";
            SamplePlayer player= new SamplePlayer(ac, SampleManager.sample(audioFile));
            Envelope rate=new Envelope(ac, 0.5);
            player.setRate(rate);
            TapIn in = new TapIn(ac, 1000);
            TapOut out = new TapOut(ac, in, 150);
            beads.Gain gDelay = new beads.Gain(ac, 2, 0.8);
            gDelay.addInput(out);
            in.addInput(gDelay);
            in.addInput(player);


            Panner p=new Panner(ac, 2);
            beads.Gain g=new beads.Gain (ac, 2, 0.5);
            g.addInput(p);
            g.addInput(player);
            p.addInput(out);
            ac.out.addInput(g);
            ac.start();
          } else

            if (i ==5) {
              String audioFile=filePath + (i+1) + ".wav";
              SamplePlayer player= new SamplePlayer(ac, SampleManager.sample(audioFile));
              Envelope rate=new Envelope(ac, 0.5);
              player.setRate(rate);
              TapIn in = new TapIn(ac, 1000);
              TapOut out = new TapOut(ac, in, 150);
              beads.Gain gDelay = new beads.Gain(ac, 2, 0.8);
              gDelay.addInput(out);
              in.addInput(gDelay);
              in.addInput(player);


              Panner p=new Panner(ac, 2);
              beads.Gain g=new beads.Gain (ac, 2, 0.5);
              g.addInput(p);
              g.addInput(player);
              p.addInput(out);
              ac.out.addInput(g);
              ac.start();
            } else

              if (i==6) {
                String audioFile=filePath + (i+1) + ".wav";
                SamplePlayer player= new SamplePlayer(ac, SampleManager.sample(audioFile));
                Envelope rate=new Envelope(ac, 0.5);
                player.setRate(rate);
                TapIn in = new TapIn(ac, 1000);
                TapOut out = new TapOut(ac, in, 150);
                beads.Gain gDelay = new beads.Gain(ac, 2, 0.8);
                gDelay.addInput(out);
                in.addInput(gDelay);
                in.addInput(player);


                Panner p=new Panner(ac, 2);
                beads.Gain g=new beads.Gain (ac, 2, 0.5);
                g.addInput(p);
                g.addInput(player);
                p.addInput(out);
                ac.out.addInput(g);
                ac.start();
              } else

                if (i==7) {
                  String audioFile=filePath + (i+1) + ".wav";
                  SamplePlayer player= new SamplePlayer(ac, SampleManager.sample(audioFile));
                  Envelope rate=new Envelope(ac, 0.5);
                  player.setRate(rate);
                  TapIn in = new TapIn(ac, 1000);
                  TapOut out = new TapOut(ac, in, 150);
                  beads.Gain gDelay = new beads.Gain(ac, 2, 0.8);
                  gDelay.addInput(out);
                  in.addInput(gDelay);
                  in.addInput(player);


                  Panner p=new Panner(ac, 2);
                  beads.Gain g=new beads.Gain (ac, 2, 0.5);
                  g.addInput(p);
                  g.addInput(player);
                  p.addInput(out);
                  ac.out.addInput(g);
                  ac.start();
                } else

                  if (i==8) {
                    String audioFile=filePath + (i+1) + ".wav";
                    SamplePlayer player= new SamplePlayer(ac, SampleManager.sample(audioFile));
                    Envelope rate=new Envelope(ac, 0.5);
                    player.setRate(rate);
                    TapIn in = new TapIn(ac, 1000);
                    TapOut out = new TapOut(ac, in, 150);
                    beads.Gain gDelay = new beads.Gain(ac, 2, 0.8);
                    gDelay.addInput(out);
                    in.addInput(gDelay);
                    in.addInput(player);


                    Panner p=new Panner(ac, 2);
                    beads.Gain g=new beads.Gain (ac, 2, 0.5);
                    g.addInput(p);
                    g.addInput(player);
                    p.addInput(out);
                    ac.out.addInput(g);
                    ac.start();
                  } else

                    if (i==9) {
                      String audioFile=filePath + (i+1) + ".wav";
                      SamplePlayer player= new SamplePlayer(ac, SampleManager.sample(audioFile));
                      Envelope rate=new Envelope(ac, 0.5);
                      player.setRate(rate);
                      TapIn in = new TapIn(ac, 1000);
                      TapOut out = new TapOut(ac, in, 150);
                      beads.Gain gDelay = new beads.Gain(ac, 2, 0.8);
                      gDelay.addInput(out);
                      in.addInput(gDelay);
                      in.addInput(player);


                      Panner p=new Panner(ac, 2);
                      beads.Gain g=new beads.Gain (ac, 2, 0.5);
                      g.addInput(p);
                      g.addInput(player);
                      p.addInput(out);
                      ac.out.addInput(g);
                      ac.start();
                    } else

                      if (i==10) {
                        String audioFile=filePath + (i+1) + ".wav";
                        SamplePlayer player= new SamplePlayer(ac, SampleManager.sample(audioFile));
                        Envelope rate=new Envelope(ac, 0.5);
                        player.setRate(rate);
                        TapIn in = new TapIn(ac, 1000);
                        TapOut out = new TapOut(ac, in, 150);
                        beads.Gain gDelay = new beads.Gain(ac, 2, 0.8);
                        gDelay.addInput(out);
                        in.addInput(gDelay);
                        in.addInput(player);


                        Panner p=new Panner(ac, 2);
                        beads.Gain g=new beads.Gain (ac, 2, 0.5);
                        g.addInput(p);
                        g.addInput(player);
                        p.addInput(out);
                        ac.out.addInput(g);
                        ac.start();
                      } else
                        if (i==11) {
                          String audioFile=filePath + (i+1) + ".wav";
                          SamplePlayer player= new SamplePlayer(ac, SampleManager.sample(audioFile));
                          Envelope rate=new Envelope(ac, 0.5);
                          player.setRate(rate);
                          TapIn in = new TapIn(ac, 1000);
                          TapOut out = new TapOut(ac, in, 150);
                          beads.Gain gDelay = new beads.Gain(ac, 2, 0.8);
                          gDelay.addInput(out);
                          in.addInput(gDelay);
                          in.addInput(player);


                          Panner p=new Panner(ac, 2);
                          beads.Gain g=new beads.Gain (ac, 2, 0.5);
                          g.addInput(p);
                          g.addInput(player);
                          p.addInput(out);
                          ac.out.addInput(g);
                          ac.start();
                        } else
                          if (i==12) {
                            String audioFile=filePath + (i+1) + ".wav";
                            SamplePlayer player= new SamplePlayer(ac, SampleManager.sample(audioFile));
                            Envelope rate=new Envelope(ac, 0.5);
                            player.setRate(rate);
                            TapIn in = new TapIn(ac, 1000);
                            TapOut out = new TapOut(ac, in, 150);
                            beads.Gain gDelay = new beads.Gain(ac, 2, 0.8);
                            gDelay.addInput(out);
                            in.addInput(gDelay);
                            in.addInput(player);


                            Panner p=new Panner(ac, 2);
                            beads.Gain g=new beads.Gain (ac, 2, 0.5);
                            g.addInput(p);
                            g.addInput(player);
                            p.addInput(out);
                            ac.out.addInput(g);
                            ac.start();
                          } else

                            if (i==13) {
                              String audioFile=filePath + (i+1) + ".wav";
                              SamplePlayer player= new SamplePlayer(ac, SampleManager.sample(audioFile));
                              Envelope rate=new Envelope(ac, 0.5);
                              player.setRate(rate);
                              TapIn in = new TapIn(ac, 1000);
                              TapOut out = new TapOut(ac, in, 150);
                              beads.Gain gDelay = new beads.Gain(ac, 2, 0.8);
                              gDelay.addInput(out);
                              in.addInput(gDelay);
                              in.addInput(player);


                              Panner p=new Panner(ac, 2);
                              beads.Gain g=new beads.Gain (ac, 2, 0.5);
                              g.addInput(p);
                              g.addInput(player);
                              p.addInput(out);
                              ac.out.addInput(g);
                              ac.start();
                            } else
                              if (i==14) {
                                String audioFile=filePath + (i+1) + ".wav";
                                SamplePlayer player= new SamplePlayer(ac, SampleManager.sample(audioFile));
                                Envelope rate=new Envelope(ac, 0.5);
                                player.setRate(rate);
                                TapIn in = new TapIn(ac, 1000);
                                TapOut out = new TapOut(ac, in, 150);
                                beads.Gain gDelay = new beads.Gain(ac, 2, 0.8);
                                gDelay.addInput(out);
                                in.addInput(gDelay);
                                in.addInput(player);


                                Panner p=new Panner(ac, 2);
                                beads.Gain g=new beads.Gain (ac, 2, 0.5);
                                g.addInput(p);
                                g.addInput(player);
                                p.addInput(out);
                                ac.out.addInput(g);
                                ac.start();
                              } else

                                if (i==15) {
                                  String audioFile=filePath + (i+1) + ".wav";
                                  SamplePlayer player= new SamplePlayer(ac, SampleManager.sample(audioFile));
                                  Envelope rate=new Envelope(ac, 0.5);
                                  player.setRate(rate);
                                  TapIn in = new TapIn(ac, 1000);
                                  TapOut out = new TapOut(ac, in, 150);
                                  beads.Gain gDelay = new beads.Gain(ac, 2, 0.8);
                                  gDelay.addInput(out);
                                  in.addInput(gDelay);
                                  in.addInput(player);


                                  Panner p=new Panner(ac, 2);
                                  beads.Gain g=new beads.Gain (ac, 2, 0.5);
                                  g.addInput(p);
                                  g.addInput(player);
                                  p.addInput(out);
                                  ac.out.addInput(g);
                                  ac.start();
                                } else

                                  if (i==16) {
                                    String audioFile=filePath + (i+1) + ".wav";
                                    SamplePlayer player= new SamplePlayer(ac, SampleManager.sample(audioFile));
                                    Envelope rate=new Envelope(ac, 0.5);
                                    player.setRate(rate);
                                    TapIn in = new TapIn(ac, 1000);
                                    TapOut out = new TapOut(ac, in, 150);
                                    beads.Gain gDelay = new beads.Gain(ac, 2, 0.8);
                                    gDelay.addInput(out);
                                    in.addInput(gDelay);
                                    in.addInput(player);


                                    Panner p=new Panner(ac, 2);
                                    beads.Gain g=new beads.Gain (ac, 2, 0.5);
                                    g.addInput(p);
                                    g.addInput(player);
                                    p.addInput(out);
                                    ac.out.addInput(g);
                                    ac.start();
                                  } else

                                    if (i==17) {
                                      String audioFile=filePath + (i+1) + ".wav";
                                      SamplePlayer player= new SamplePlayer(ac, SampleManager.sample(audioFile));
                                      Envelope rate=new Envelope(ac, 0.5);
                                      player.setRate(rate);
                                      TapIn in = new TapIn(ac, 1000);
                                      TapOut out = new TapOut(ac, in, 150);
                                      beads.Gain gDelay = new beads.Gain(ac, 2, 0.8);
                                      gDelay.addInput(out);
                                      in.addInput(gDelay);
                                      in.addInput(player);


                                      Panner p=new Panner(ac, 2);
                                      beads.Gain g=new beads.Gain (ac, 2, 0.5);
                                      g.addInput(p);
                                      g.addInput(player);
                                      p.addInput(out);
                                      ac.out.addInput(g);
                                      ac.start();
                                    } else

                                      if (i==18) {
                                        String audioFile=filePath + (i+1) + ".wav";
                                        SamplePlayer player= new SamplePlayer(ac, SampleManager.sample(audioFile));
                                        Envelope rate=new Envelope(ac, 0.5);
                                        player.setRate(rate);
                                        TapIn in = new TapIn(ac, 1000);
                                        TapOut out = new TapOut(ac, in, 150);
                                        beads.Gain gDelay = new beads.Gain(ac, 2, 0.8);
                                        gDelay.addInput(out);
                                        in.addInput(gDelay);
                                        in.addInput(player);


                                        Panner p=new Panner(ac, 2);
                                        beads.Gain g=new beads.Gain (ac, 2, 0.5);
                                        g.addInput(p);
                                        g.addInput(player);
                                        p.addInput(out);
                                        ac.out.addInput(g);
                                        ac.start();
                                      } else

                                        if (i==19) {
                                          String audioFile=filePath + (i+1) + ".wav";
                                          SamplePlayer player= new SamplePlayer(ac, SampleManager.sample(audioFile));
                                          Envelope rate=new Envelope(ac, 0.5);
                                          player.setRate(rate);
                                          TapIn in = new TapIn(ac, 1000);
                                          TapOut out = new TapOut(ac, in, 150);
                                          beads.Gain gDelay = new beads.Gain(ac, 2, 0.8);
                                          gDelay.addInput(out);
                                          in.addInput(gDelay);
                                          in.addInput(player);


                                          Panner p=new Panner(ac, 2);
                                          beads.Gain g=new beads.Gain (ac, 2, 0.5);
                                          g.addInput(p);
                                          g.addInput(player);
                                          p.addInput(out);
                                          ac.out.addInput(g);
                                          ac.start();
                                        } else

                                          if (i==20) {
                                            String audioFile=filePath + (i+1) + ".wav";
                                            SamplePlayer player= new SamplePlayer(ac, SampleManager.sample(audioFile));
                                            Envelope rate=new Envelope(ac, 0.5);
                                            player.setRate(rate);
                                            TapIn in = new TapIn(ac, 1000);
                                            TapOut out = new TapOut(ac, in, 150);
                                            beads.Gain gDelay = new beads.Gain(ac, 2, 0.8);
                                            gDelay.addInput(out);
                                            in.addInput(gDelay);
                                            in.addInput(player);


                                            Panner p=new Panner(ac, 2);
                                            beads.Gain g=new beads.Gain (ac, 2, 0.5);
                                            g.addInput(p);
                                            g.addInput(player);
                                            p.addInput(out);
                                            ac.out.addInput(g);
                                            ac.start();
                                          } else

                                            if (i==21) {
                                              String audioFile=filePath + (i+1) + ".wav";
                                              SamplePlayer player= new SamplePlayer(ac, SampleManager.sample(audioFile));
                                              Envelope rate=new Envelope(ac, 0.5);
                                              player.setRate(rate);
                                              TapIn in = new TapIn(ac, 1000);
                                              TapOut out = new TapOut(ac, in, 150);
                                              beads.Gain gDelay = new beads.Gain(ac, 2, 0.8);
                                              gDelay.addInput(out);
                                              in.addInput(gDelay);
                                              in.addInput(player);


                                              Panner p=new Panner(ac, 2);
                                              beads.Gain g=new beads.Gain (ac, 2, 0.5);
                                              g.addInput(p);
                                              g.addInput(player);
                                              p.addInput(out);
                                              ac.out.addInput(g);
                                              ac.start();
                                            } else

                                              if (i==22) {
                                                String audioFile=filePath + (i+1) + ".wav";
                                                SamplePlayer player= new SamplePlayer(ac, SampleManager.sample(audioFile));
                                                Envelope rate=new Envelope(ac, 0.5);
                                                player.setRate(rate);
                                                TapIn in = new TapIn(ac, 1000);
                                                TapOut out = new TapOut(ac, in, 150);
                                                beads.Gain gDelay = new beads.Gain(ac, 2, 0.8);
                                                gDelay.addInput(out);
                                                in.addInput(gDelay);
                                                in.addInput(player);


                                                Panner p=new Panner(ac, 2);
                                                beads.Gain g=new beads.Gain (ac, 2, 0.5);
                                                g.addInput(p);
                                                g.addInput(player);
                                                p.addInput(out);
                                                ac.out.addInput(g);
                                                ac.start();
                                              }
}

void glissandoHightoLow() {

 player_2 = minim_2.loadFile("glissando high to low.wav");
 player_2.play();
}

void glissandoLowtoHigh() {

  player_2 = minim_2.loadFile("glissando low to high.wav");
  player_2.play();
}
