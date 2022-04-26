include <Round-Anything-1.0.4/polyround.scad>

// Adjust number of facets for solids
$fa = 1; // 360/$fa = $fn facets maximum
$fs = 1; // prefered facet length
//$fn=120; // this will always override $fa and $fs

Y_top = 45;
Y_top_ring_height = 20;
Y_bottom_ring_height = 20;
Y_bottom_ring_insert_height = 5;
Y1 = Y_top - Y_top_ring_height;
Y2 = Y_top - Y_top_ring_height - Y_bottom_ring_height;
Y3 = Y_top - Y_top_ring_height - Y_bottom_ring_height - Y_bottom_ring_insert_height;
freeplay = 0.5;
wall_dose= 4;
wall_siebtraeger= 3;
X_dose_radius = 58.0/2;
X_siebtraeger_radius_outer = 60.0/2;
X_siebtraeger_radius_inner = 52.0/2;

echo("X_dose_radius = ", X_dose_radius);
echo("X_siebtraeger_radius_outer = ", X_siebtraeger_radius_outer);
echo("X_siebtraeger_radius_inner = ", X_siebtraeger_radius_inner);

radiiPoints=[
  [X_dose_radius+freeplay, Y_top, 2], //1
  [X_dose_radius+freeplay+wall_dose, Y_top, 2], //2
  [X_dose_radius+freeplay+wall_dose, Y1, 3], //3
  [X_siebtraeger_radius_outer + freeplay, Y2, 3], //4
  [X_siebtraeger_radius_inner - freeplay, Y2, 3], //5
  [X_siebtraeger_radius_inner - freeplay, Y3, 1], //6
  [X_siebtraeger_radius_inner - freeplay - wall_siebtraeger, Y3, 1], //7
  [X_siebtraeger_radius_inner - freeplay - wall_siebtraeger, Y2, 1], //8
  [X_dose_radius+freeplay, Y1, 3] //9
];

rotate_extrude(angle=360, convexity=200) {
    polygon(
        polyRound(
            radiiPoints, 100
        )
    );
};