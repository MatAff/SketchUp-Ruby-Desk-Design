 
 
 def points_to_ab(p1,p2)  
	a = 1.0 * (p2[1] - p1[1]) / (p2[0] - p1[0])
	b = p1[1] - a * p1[0]
    return [a,b]
 end

 def intersect(i1,s1,i2,s2)
    # Input: intercept and slope values
	x = 1.0 * (i2 - i1) / (s1 - s2)
	y = x * s1 + i1
	return [x,y]
 end 
  
def points_shape(pts, thickness)
 
    # Bracket all of the entity creation, looks like a single operation for undo.
    model = Sketchup.active_model
    model.start_operation $exStrings.GetString("Create Box")       	
    entities = model.active_entities 
    group = entities.add_group
    entities = group.entities

    # Create shape
    base = entities.add_face pts
    base.pushpull thickness
	
    # Operation end
    model.commit_operation
	
end
  
def box(sx,ex,sy,ey,ez,sz)
 
    # Bracket all of the entity creation, looks like a single operation for undo.
    model = Sketchup.active_model
    model.start_operation $exStrings.GetString("Create Box")       	
    entities = model.active_entities 
    group = entities.add_group
    entities = group.entities
	
    # Create rectangle
    pts = []
    pts[0] = [sx, sy, sz]
    pts[1] = [ex, sy, sz]
    pts[2] = [ex, ey, sz]
    pts[3] = [sx, ey, sz]
    base = entities.add_face pts
    base.pushpull ez - sz
	
    # Operation end
    model.commit_operation
 
end
 
def origin_box(width,height,depth)
 
	# Bracket all of the entity creation, looks like a single operation for undo.
    model = Sketchup.active_model
    model.start_operation $exStrings.GetString("Create Box")       	
    entities = model.active_entities 
	
	# Create a group
	group = entities.add_group
    entities = group.entities
    
	# Create rectangle
    pts = []
    pts[0] = [0, 0, 0]
    pts[1] = [width, 0, 0]
    pts[2] = [width, depth, 0]
    pts[3] = [0, depth, 0]
    base = entities.add_face pts
	
	# Push pull
	base.pushpull height * -1
    
    # Operation end
    model.commit_operation
	
end

# def quad_shape(p1,p2,p3,p4,thickness)
 
    # # Bracket all of the entity creation, looks like a single operation for undo.
    # model = Sketchup.active_model
    # model.start_operation $exStrings.GetString("Create Box")       	
    # entities = model.active_entities 
    # group = entities.add_group
    # entities = group.entities
	
    # # Create rectangle
    # pts = []
    # pts[0] = p1
    # pts[1] = p2
    # pts[2] = p3
    # pts[3] = p4	
    # base = entities.add_face pts
    # base.pushpull thickness
	
    # # Operation end
    # model.commit_operation
 
# end
 
# def penta_shape(p1,p2,p3,p4,p5,thickness)
 
    # # Bracket all of the entity creation, looks like a single operation for undo.
    # model = Sketchup.active_model
    # model.start_operation $exStrings.GetString("Create Box")       	
    # entities = model.active_entities 
    # group = entities.add_group
    # entities = group.entities
	
    # # Create rectangle
    # pts = []
    # pts[0] = p1
    # pts[1] = p2
    # pts[2] = p3
    # pts[3] = p4
	# pts[4] = p5
    # base = entities.add_face pts
    # base.pushpull thickness
	
    # # Operation end
    # model.commit_operation
 
# end

