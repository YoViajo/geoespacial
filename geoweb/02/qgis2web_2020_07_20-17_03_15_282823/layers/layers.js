ol.proj.proj4.register(proj4);
ol.proj.get("EPSG:4326").setExtent([-63.226468, -17.807192, -63.167416, -17.769395]);
var wms_layers = [];

var format_tracks_0 = new ol.format.GeoJSON();
var features_tracks_0 = format_tracks_0.readFeatures(json_tracks_0, 
            {dataProjection: 'EPSG:4326', featureProjection: 'EPSG:4326'});
var jsonSource_tracks_0 = new ol.source.Vector({
    attributions: ' ',
});
jsonSource_tracks_0.addFeatures(features_tracks_0);
var lyr_tracks_0 = new ol.layer.Vector({
                declutter: true,
                source:jsonSource_tracks_0, 
                style: style_tracks_0,
                interactive: false,
                title: '<img src="styles/legend/tracks_0.png" /> tracks'
            });

lyr_tracks_0.setVisible(true);
var layersList = [lyr_tracks_0];
lyr_tracks_0.set('fieldAliases', {'name': 'name', 'cmt': 'cmt', 'desc': 'desc', 'src': 'src', 'link1_href': 'link1_href', 'link1_text': 'link1_text', 'link1_type': 'link1_type', 'link2_href': 'link2_href', 'link2_text': 'link2_text', 'link2_type': 'link2_type', 'number': 'number', 'type': 'type', });
lyr_tracks_0.set('fieldImages', {'name': '', 'cmt': '', 'desc': '', 'src': '', 'link1_href': '', 'link1_text': '', 'link1_type': '', 'link2_href': '', 'link2_text': '', 'link2_type': '', 'number': '', 'type': '', });
lyr_tracks_0.set('fieldLabels', {'name': 'no label', 'cmt': 'no label', 'desc': 'no label', 'src': 'no label', 'link1_href': 'no label', 'link1_text': 'no label', 'link1_type': 'no label', 'link2_href': 'no label', 'link2_text': 'no label', 'link2_type': 'no label', 'number': 'no label', 'type': 'no label', });
lyr_tracks_0.on('precompose', function(evt) {
    evt.context.globalCompositeOperation = 'normal';
});