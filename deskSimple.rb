
# deskSimple.rb

# load "C:\\Users\\Mathijs\\Documents\\Projects\\2018 Sketchup ruby\\SketchUp-Ruby-Desk-Design\\ruby.rb"
# load "C:\\Users\\Mathijs\\Documents\\Projects\\2018 Sketchup ruby\\SketchUp-Ruby-Desk-Design\\deskSimple.rb"

# Dimensions
$dWidth=48
$dHeight=30
$dDepth=30
$sDepth=12
$sWidth=20
$sHeight=12

$boardThickness=0.75
$ledgeHeight=10

$offset=10
#$sHeight=16
$overhang=8
$open=true

# Build desk
def build_desk()
    build_base()
    build_left()
	build_right()
	if $open==false
	  closed_sides()
	end 
	build_top()	
	build_ledge()
	if $open==true 
	  build_monitor_set($offset+4,$offset,$dHeight)
	else
	  build_monitor_set($offset+4,$offset,$ledgeHeight)
	end
end

def build_base()
	box(0,$dWidth + 20 ,0,$dWidth + 20, 0, -20)
end

def build_left()		
	build_side($offset)
end

def build_right()	
	build_side($offset+$dWidth-$boardThickness)
end

def build_side(x)
	p1 = [x,$offset,0] # Bottom back
	p2 = [x,$offset+$sDepth,0] # Bottom front	
	p3 = [x,$offset+$sDepth,$dHeight-$boardThickness] # Top front
	p4 = [x,$offset,$dHeight-$boardThickness]# Top back
	points_shape([p1,p2,p3,p4],$boardThickness)	
	if $open==true 
	  p6 = [x,$offset+$dDepth-$overhang,$dHeight-$boardThickness] # Top front
	  p5 = [x,$offset+$dDepth-$overhang,0] # Bottom front	
	  points_shape([p3,p2,p5,p6],$boardThickness)				
	end
end

def closed_sides()
	p1 = [$offset+$boardThickness,$offset+$sDepth,0]
	p2 = [$offset+$boardThickness,$offset+$sDepth,$dHeight-$boardThickness]
	p3 = [$offset+$boardThickness+$dDepth-$sDepth-$overhang,$offset+$sDepth,$dHeight-$boardThickness]
	p4 = [$offset+$boardThickness+$dDepth-$sDepth-$overhang,$offset+$sDepth,0]
	points_shape([p1,p2,p3,p4],$boardThickness)	
    p5 = [$offset+$dWidth-$boardThickness,$offset+$sDepth,0]
	p6 = [$offset+$dWidth-$boardThickness,$offset+$sDepth,$dHeight-$boardThickness]
	p7 = [$offset+$dWidth-$boardThickness-$dDepth+$sDepth+$overhang,$offset+$sDepth,$dHeight-$boardThickness]
	p8 = [$offset+$dWidth-$boardThickness-$dDepth+$sDepth+$overhang,$offset+$sDepth,0]
	points_shape([p5,p6,p7,p8],-$boardThickness)					
end

def build_top()
	box($offset,$offset+$dWidth,$offset,$offset+$sDepth+$boardThickness,$dHeight-$boardThickness,$dHeight)
	if $open==true
	  box($offset,$offset+$dWidth,$offset+$sDepth+$boardThickness,$offset+$dDepth,$dHeight-$boardThickness,$dHeight)
	else
	  box($offset,$offset+$dWidth,$offset+$sDepth+$boardThickness,$offset+$sDepth+$boardThickness*2,$dHeight-$boardThickness-$dDepth+$sDepth,$dHeight-$boardThickness)	  	  
	end
end

def build_ledge()
	box($offset+$boardThickness,$offset+$dWidth-$boardThickness,$offset,$offset+$sDepth,$ledgeHeight-$boardThickness,$ledgeHeight)
end

def build_monitor_set(x,y,z)
   box(x,x+$sWidth*2,y,y+$sDepth,z,z+$boardThickness)
   box(x,x+$sWidth,y+3,y+4,z+4,z+4+$sHeight)
   box(x+$sWidth,x+$sWidth*2,y+3,y+4,z+4,z+4+$sHeight)
   box(x+$sWidth*0.5-2,x+$sWidth*0.5+2,y+3,y+4,z+$boardThickness,z+4)
   box(x+$sWidth*1.5-2,x+$sWidth*1.5+2,y+3,y+4,z+$boardThickness,z+4)
end

build_desk()
