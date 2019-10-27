vidC = document.createElement('video')
vidC.autoplay = true
vidC.loop = true
vidC.playbackRate = 2
vidC.src = atom.project.getPaths()[0]+`/gif2.mp4`

vid = document.createElement('video')
vid.autoplay = true
vid.loop = true
vid.playbackRate = 2
vid.src = atom.project.getPaths()[0]+`/gif1.mp4`

s0.init({src: vid})
s1.init({src: vidC})

a.show()
a.setBins(10)
fi = (i=0,v=100,min=0.001, max=v) => () =>  Math.min( min + a.fft[i]*v,max)

shape(3, 0.002,0.5)
  //.repeat(1,3)
  .color(1,0.02,0.2)
  .blend(o0,0.2)
  .rotate(0.6,0.02)
  .modulateScale(src(o1),fi(2,10,0,2,0.2))
.out(o1)

 src(o1)
 //.add(src(o1).scrollX(0.02,0.0002))
 .modulateScrollX(src(o1).scale(-fi(2,0.002,0,0.5)),0.4)
 .color(0,0,1)
  //.scale(fi(0,0.05-0.8,1.525,0.2,11)
  //.layer(src(s0).color(fi(0,5,0.,1)).repeat(1,),0.2)
    .add(o1,0.6)
.out(o0)
