fn drawEdgeBox p1_1 p2_1 =
(
	p1 = getVert $ p1_1
	p2 = getVert $ p2_1
	mybox = box()
  /* rotating box to the euler angles of the edge */
	dir = normalize (p2 - p1)
	vec = mybox.transform[3]
	tm = mybox.transform
	vec = normalize vec
	dir = normalize dir
	rtm = angleaxis (acos (dot vec dir)) (normalize (cross dir vec))
	mybox.transform = translate (rotate (scalematrix tm.scale) (tm.rotation*rtm)) tm.pos
	--
	if pos == true do mybox.pos = p1
	mybox.width = 1
	mybox.height = sqrt ((p1.x-p2.x)*(p1.x-p2.x)+(p1.y-p2.y)*(p1.y-p2.y)+(p1.z-p2.z)*(p1.z-p2.z))
	mybox.length = 1
	mybox.pos = p1
)

for f in getFaceSelection $ do
(
	if (getEdgeVis $ f 1) then
		drawEdgeBox ((getFace $ f)[1]) ((getFace $ f)[2])
	if (getEdgeVis $ f 2) then
		drawEdgeBox ((getFace $ f)[2]) ((getFace $ f)[3])
	if (getEdgeVis $ f 3) then
		drawEdgeBox ((getFace $ f)[3]) ((getFace $ f)[1])
)
