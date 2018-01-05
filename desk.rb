
# load "C:\\Users\\Mathijs\\Documents\\Projects\\2018 Sketchup ruby\\SketchUp-Ruby-Desk-Design\\ruby.rb"
# load "C:\\Users\\Mathijs\\Documents\\Projects\\2018 Sketchup ruby\\SketchUp-Ruby-Desk-Design\\desk.rb"

# Dimensions
$dWidth=50
$dHeight=30
$dDepth=30
$boardThickness=0.75
$offset=10
$sDepth=8
$sHeight=16
$overhang=8

# Build desk
def build_desk()
    build_base()
    build_back()
    build_left()
    build_right()
    build_top()
	build_screen()
end

def build_base()
	box(0,$dWidth + 20 ,0,$dWidth + 20, 0, -20)
end

def build_back()
	#box($offset, $offset + $dWidth,$offset,$offset+$boardThickness,0,$dHeight-$sDepth)
	w = 6
	box($offset, $offset + $dWidth,$offset,$offset+$boardThickness,0,w)
	box($offset, $offset +w,$offset,$offset+$boardThickness,w,$dHeight-$sDepth-w)
	box($offset + $dWidth - w, $offset + $dWidth,$offset,$offset+$boardThickness,w,$dHeight-$sDepth-w)
	box($offset, $offset + $dWidth,$offset,$offset+$boardThickness,$dHeight-$sDepth-w,$dHeight-$sDepth)
end

def build_side(x)
	p1 = [x,$offset+$boardThickness,0] # Bottom back
	p2 = [x,$offset+$dDepth-$overhang,0] # Bottom front
	p7 = [x,$offset+$dDepth-$overhang,$overhang]
	p3 = [x,$offset+$sDepth,$dHeight-$sDepth]
	p4 = [x,$offset+$boardThickness,$dHeight-$sDepth]# Top back
	points_shape([p1,p2,p7,p3,p4],$boardThickness)
	#quad_shape(p1,p2,p3,p4,$boardThickness)
	p5 = [x,$offset+$sDepth,$dHeight-$boardThickness]
	p6 = [x,$offset+$dDepth-$overhang,$dHeight-$boardThickness]
	points_shape([p6,p5,p3,p7],$boardThickness)
	#quad_shape(p6,p5,p3,p7,$boardThickness)
end

def build_left()	
	#box($offset,$offset+$boardThickness,$offset+$boardThickness, $offset+$dDepth, 0, $dHeight - $boardThickness)	
	build_side($offset)
end

def build_right()
	#box($offset+$dWidth-$boardThickness,$offset+$dWidth,$offset + $boardThickness, $offset+$dDepth, 0, $dHeight - $boardThickness)
	build_side($offset+$dWidth-$boardThickness)
end

def build_top()
	box($offset,$offset+$dWidth,$offset+$sDepth,$offset+$dDepth,$dHeight-$boardThickness,$dHeight)
end

def test_penta_shape()
	penta_shape([0,0,0],[0,5,0],[5,5,0],[5,0,0],[1,1,0],5)
end

def build_screen()
    box($offset,$offset+$dWidth,$offset,$offset+$sDepth,$dHeight-$boardThickness,$dHeight)
	box($offset,$offset+$dWidth,$offset,$offset+$boardThickness,$dHeight,$dHeight+$sHeight)
	p1 = [$offset,$offset+$boardThickness,$dHeight]
	p2 = [$offset,$offset+$boardThickness,$dHeight+$sHeight]
	p3 = [$offset,$offset+$sDepth,$dHeight]
	points_shape([p3,p2,p1],$boardThickness)
end

build_desk()




