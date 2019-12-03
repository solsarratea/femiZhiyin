a.show()
a.setBins(10)
fi = (i=0,v=100,min=0.001, max=v) => () =>  Math.min( min + a.fft[i]*v,max)

p = new P5()
video = (name) => {
  vid = p.createVideo(atom.project.getPaths()+`/data/videos/${name}.mp4`)
  vid.loop()
}
//
initialVideo = 'gif1'
video(initialVideo)

p.draw = () => {
  p.clear()
  p.image(vid, 0, 0, p.width, p.height)
}

p.hide()
s0.init({src: p.canvas})


shape(3, 0.0002,0.2)
  //.repeat(1,3)
  .color(1,0.02,0.2)
  .blend(o0,0.7)
  .rotate(0.6,0.02)
  .modulateScale(src(o1),fi(2,10,0,2,0.2))
.out(o2)

 src(o1)
 .diff(src(o0).scale(1.02))
 //.add(src(o1).scrollX(0.02,0.0002))
  .modulateScrollX(src(o1).scale(-fi(2,0.02,0,0.5)),0.4)
  .color(0,0,1)
  //.layer(src(s0).color(fi(0,5,0.,1)))
  //.add(o1,0.6)
.out(o0)

render(o2)
