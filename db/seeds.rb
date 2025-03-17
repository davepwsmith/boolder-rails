# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# boulder_geojson = '{
#   "type": "Feature",
#   "geometry": {
#     "coordinates": [
#       [
#         [
#           -1.8025406553808523,
#           53.917196466925844
#         ],
#         [
#           -1.8025375641745995,
#           53.91716478886531
#         ],
#         [
#           -1.8025187078195302,
#           53.91712145906567
#         ],
#         [
#           -1.8024689394051165,
#           53.91711071763754
#         ],
#         [
#           -1.8024061879265219,
#           53.91711035352125
#         ],
#         [
#           -1.8023542556686039,
#           53.91712327964606
#         ],
#         [
#           -1.8023403452424986,
#           53.9171478574784
#         ],
#         [
#           -1.8023496188602337,
#           53.91719227959743
#         ],
#         [
#           -1.802436172623004,
#           53.91721084948571
#         ],
#         [
#           -1.8025406553808523,
#           53.917196466925844
#         ]
#       ]
#     ],
#     "type": "Polygon"
#   }
# }'

# arete_geojson = '{
#   "type": "Feature",
#   "geometry": {
#     "coordinates": [
#       -1.8025272731136397,
#       53.91716931373759
#     ],
#     "type": "Point"
#   }
# }'

# chips_geojson = '{
#   "type": "Feature",
#   "geometry": {
#     "coordinates": [
#       -1.802498524899562,
#       53.917127258349154
#     ],
#     "type": "Point"
#   }
# }'

# boulder = RGeo::GeoJSON.decode(boulder_geojson).geometry
# arete = RGeo::GeoJSON.decode(arete_geojson).geometry
# chips= RGeo::GeoJSON.decode(chips_geojson).geometry

# clusters = Cluster.create(name: "Ilkley")

# area = Area.create(name: "Ilkley Quarries", published: true, slug: "ilkley-quarries", cluster: clusters)

# boulder = Boulder.create(polygon: boulder, area: area)

# Problem.create(name: "The Chipped Slab", location: chips, grade: '1a', area: area, steepness: 'slab')
# Problem.create(name: "Calf Arete", location: arete, grade: '2a', area: area, steepness: 'slab')
