OVERLAP = 0.001;
HAIRS_PER_LAYER = 100;
LAYER_SHIFT_DISTANCE = 0.2;

defaultHairLength = 36;
nozzleWidth = 0.27;
layerHeight = 0.20;
innerOverlap = 2.0*nozzleWidth;
outerOverlap = 0.5*nozzleWidth;
defaultWallThickness = 3*nozzleWidth;
topThickness = 4*layerHeight;

PART = "HAT"; // BODY_HAIR, BODY_SKIN, HEAD_HAIR, HEAD_SKIN, HAT

create();

module create(){
    if (PART == "BODY_HAIR"){
        $fn=50;
        hair(90,105,10,0);
        hair(105,105,5,10);
        hair(105,105,95,15);
        hair(105,125,25,110);
        hair(125,125,15,135);
    } else if (PART == "BODY_SKIN"){
        $fn=200;
        skin(90,105,10,0,1.5*defaultWallThickness);
        skin(105,105,5,10,1.5*defaultWallThickness);
        skin(105,105,95,15);
        skin(105,125,25,110);
        skin(125,125,15,135,1.5*defaultWallThickness);
        difference(){
            cylinder(d=90+OVERLAP, h=topThickness);
            translate([0,0,-OVERLAP/2])
            cylinder(d=5.5, h=topThickness+OVERLAP);
        }
        translate([0,0,topThickness])
        difference(){
            cylinder(d=90+OVERLAP, h=topThickness);
            translate([0,0,-OVERLAP/2])
            cylinder(d=80, h=topThickness+OVERLAP);
        }
        
        difference(){
            cylinder(d=90+2*defaultHairLength+4, h=2*layerHeight);
            translate([0,0,-OVERLAP/2])
            cylinder(d=90+2*defaultHairLength, h=2*layerHeight+OVERLAP);
        }
    } else if (PART == "HEAD_HAIR"){
        $fn=50;
        headDia = 91;
        hair(headDia,headDia,15,0);
        hair(headDia,20,headDia*1.15/2-1,15);
    } else if(PART == "HEAD_SKIN"){
        $fn=200;
        headDia = 91;
        
        difference(){
            union(){
                translate([0,0,15])
                scale([1,1,1.15])
                difference(){
                    sphere(headDia/2);
                    translate([-headDia/2,-headDia/2,-headDia])
                    cube(headDia+OVERLAP);
                    
                    translate([-headDia/2,-headDia/2,headDia/2-1])
                    cube(headDia+OVERLAP);
                }
                    
                translate([0,0,0])
                cylinder(d=15, h=headDia/2*1.15+15-1.5+24, $fn=6);
                
                cylinder(d=headDia,h=15);
            }
            
            cylinder(d=5.2, h=100, center=true);
            cylinder(d=5.6, h=0.6, center=true);
        }
        
        difference(){
            cylinder(d=90+2*defaultHairLength+4, h=2*layerHeight);
            translate([0,0,-OVERLAP/2])
            cylinder(d=90+2*defaultHairLength, h=2*layerHeight+OVERLAP);
        }
        
        skin(headDia,headDia,15,0);
        skin(headDia,20,headDia*1.15/2-1.2,15);
    } else if (PART == "HAT"){
        $fn=200;
        difference(){
            scale([1.25,1,1])
            {
                cylinder(d=70, h=1.5);
                
                translate([0,0,1.5-OVERLAP])
                difference(){
                    cylinder(d=70, h=2);
                    cylinder(d=65, h=2+OVERLAP);
                }
                
                translate([0,0,1.5-OVERLAP])
                cylinder(d=55, h=25);
            }
            
            translate([0,0,0])
            cylinder(d=15.9, h=25.2, $fn=6);
            
            translate([0,0,0])
            cylinder(d=16.2, h=0.8, $fn=6);
            
            translate([0,0,-OVERLAP])
            cylinder(d=16.5, h=0.4, $fn=6);
        }
    }
}

module hair(innerDiaStart, innerDiaEnd, height, startHeight, hairLength=defaultHairLength, layerShiftStart=0, wallThickness=defaultWallThickness){
    color("blue")    
    for(i=[1:height]){
        dia = innerDiaStart - 2*innerOverlap + (innerDiaEnd-innerDiaStart)*i/height;
        for (j=[0:360/HAIRS_PER_LAYER:359.9]){
            rotate([0,0,j+(layerShiftStart+i*360/HAIRS_PER_LAYER*LAYER_SHIFT_DISTANCE)])
            translate([dia/2,-nozzleWidth/2,startHeight+i])
            cube([hairLength+innerOverlap+outerOverlap,nozzleWidth,layerHeight]);
            //rotate([-90,0,90])
            //cylinder(h=hairLength,d=nozzleWidth,center=true);
        }
    }
}

module skin(innerDiaStart, innerDiaEnd, height, startHeight, wallThickness=defaultWallThickness){
    translate([0,0,startHeight])
    difference(){
        cylinder(d1=innerDiaStart, d2=innerDiaEnd, h=height);
        translate([0,0,-OVERLAP/2])
        cylinder(d1=innerDiaStart-2*wallThickness, d2=
innerDiaEnd-2*wallThickness, h=height+OVERLAP);
    }
    
    translate([0,0,startHeight])
    difference(){
        cylinder(d1=innerDiaStart+2*defaultHairLength+2*nozzleWidth, d2=innerDiaEnd+2*defaultHairLength+2*nozzleWidth, h=height);
        translate([0,0,-OVERLAP/2])
        cylinder(d1=innerDiaStart+2*defaultHairLength, d2=
innerDiaEnd+2*defaultHairLength, h=height+OVERLAP);
    }
}