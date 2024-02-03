var wms_layers = [];

var format_imgs_exifs_2_0 = new ol.format.GeoJSON();
var features_imgs_exifs_2_0 = format_imgs_exifs_2_0.readFeatures(json_imgs_exifs_2_0, 
            {dataProjection: 'EPSG:4326', featureProjection: 'EPSG:3857'});
var jsonSource_imgs_exifs_2_0 = new ol.source.Vector({
    attributions: ' ',
});
jsonSource_imgs_exifs_2_0.addFeatures(features_imgs_exifs_2_0);
var lyr_imgs_exifs_2_0 = new ol.layer.Vector({
                declutter: true,
                source:jsonSource_imgs_exifs_2_0, 
                style: style_imgs_exifs_2_0,
                interactive: true,
                title: '<img src="styles/legend/imgs_exifs_2_0.png" /> imgs_exifs_2'
            });
var format_oferta_inmobiliariagrupo_1_1 = new ol.format.GeoJSON();
var features_oferta_inmobiliariagrupo_1_1 = format_oferta_inmobiliariagrupo_1_1.readFeatures(json_oferta_inmobiliariagrupo_1_1, 
            {dataProjection: 'EPSG:4326', featureProjection: 'EPSG:3857'});
var jsonSource_oferta_inmobiliariagrupo_1_1 = new ol.source.Vector({
    attributions: ' ',
});
jsonSource_oferta_inmobiliariagrupo_1_1.addFeatures(features_oferta_inmobiliariagrupo_1_1);
var lyr_oferta_inmobiliariagrupo_1_1 = new ol.layer.Vector({
                declutter: true,
                source:jsonSource_oferta_inmobiliariagrupo_1_1, 
                style: style_oferta_inmobiliariagrupo_1_1,
                interactive: true,
    title: 'oferta_inmobiliaria — grupo_1<br />\
    <img src="styles/legend/oferta_inmobiliariagrupo_1_1_0.png" /> apartamento<br />\
    <img src="styles/legend/oferta_inmobiliariagrupo_1_1_1.png" /> casa<br />\
    <img src="styles/legend/oferta_inmobiliariagrupo_1_1_2.png" /> <br />'
        });
var format_imgs_exifs_3_2 = new ol.format.GeoJSON();
var features_imgs_exifs_3_2 = format_imgs_exifs_3_2.readFeatures(json_imgs_exifs_3_2, 
            {dataProjection: 'EPSG:4326', featureProjection: 'EPSG:3857'});
var jsonSource_imgs_exifs_3_2 = new ol.source.Vector({
    attributions: ' ',
});
jsonSource_imgs_exifs_3_2.addFeatures(features_imgs_exifs_3_2);
var lyr_imgs_exifs_3_2 = new ol.layer.Vector({
                declutter: true,
                source:jsonSource_imgs_exifs_3_2, 
                style: style_imgs_exifs_3_2,
                interactive: true,
                title: '<img src="styles/legend/imgs_exifs_3_2.png" /> imgs_exifs_3'
            });
var format_oferta_inmobiliariagrupo_2_3 = new ol.format.GeoJSON();
var features_oferta_inmobiliariagrupo_2_3 = format_oferta_inmobiliariagrupo_2_3.readFeatures(json_oferta_inmobiliariagrupo_2_3, 
            {dataProjection: 'EPSG:4326', featureProjection: 'EPSG:3857'});
var jsonSource_oferta_inmobiliariagrupo_2_3 = new ol.source.Vector({
    attributions: ' ',
});
jsonSource_oferta_inmobiliariagrupo_2_3.addFeatures(features_oferta_inmobiliariagrupo_2_3);
var lyr_oferta_inmobiliariagrupo_2_3 = new ol.layer.Vector({
                declutter: true,
                source:jsonSource_oferta_inmobiliariagrupo_2_3, 
                style: style_oferta_inmobiliariagrupo_2_3,
                interactive: true,
    title: 'oferta_inmobiliaria — grupo_2<br />\
    <img src="styles/legend/oferta_inmobiliariagrupo_2_3_0.png" /> apartamento<br />\
    <img src="styles/legend/oferta_inmobiliariagrupo_2_3_1.png" /> casa<br />\
    <img src="styles/legend/oferta_inmobiliariagrupo_2_3_2.png" /> <br />'
        });
var format_imgs_exifs_2_4 = new ol.format.GeoJSON();
var features_imgs_exifs_2_4 = format_imgs_exifs_2_4.readFeatures(json_imgs_exifs_2_4, 
            {dataProjection: 'EPSG:4326', featureProjection: 'EPSG:3857'});
var jsonSource_imgs_exifs_2_4 = new ol.source.Vector({
    attributions: ' ',
});
jsonSource_imgs_exifs_2_4.addFeatures(features_imgs_exifs_2_4);
var lyr_imgs_exifs_2_4 = new ol.layer.Vector({
                declutter: true,
                source:jsonSource_imgs_exifs_2_4, 
                style: style_imgs_exifs_2_4,
                interactive: true,
                title: '<img src="styles/legend/imgs_exifs_2_4.png" /> imgs_exifs_2'
            });
var format_oferta_inmobiliariagrupo_1_5 = new ol.format.GeoJSON();
var features_oferta_inmobiliariagrupo_1_5 = format_oferta_inmobiliariagrupo_1_5.readFeatures(json_oferta_inmobiliariagrupo_1_5, 
            {dataProjection: 'EPSG:4326', featureProjection: 'EPSG:3857'});
var jsonSource_oferta_inmobiliariagrupo_1_5 = new ol.source.Vector({
    attributions: ' ',
});
jsonSource_oferta_inmobiliariagrupo_1_5.addFeatures(features_oferta_inmobiliariagrupo_1_5);
var lyr_oferta_inmobiliariagrupo_1_5 = new ol.layer.Vector({
                declutter: true,
                source:jsonSource_oferta_inmobiliariagrupo_1_5, 
                style: style_oferta_inmobiliariagrupo_1_5,
                interactive: true,
    title: 'oferta_inmobiliaria — grupo_1<br />\
    <img src="styles/legend/oferta_inmobiliariagrupo_1_5_0.png" /> apartamento<br />\
    <img src="styles/legend/oferta_inmobiliariagrupo_1_5_1.png" /> casa<br />\
    <img src="styles/legend/oferta_inmobiliariagrupo_1_5_2.png" /> <br />'
        });
var format_imgs_exifs_3_6 = new ol.format.GeoJSON();
var features_imgs_exifs_3_6 = format_imgs_exifs_3_6.readFeatures(json_imgs_exifs_3_6, 
            {dataProjection: 'EPSG:4326', featureProjection: 'EPSG:3857'});
var jsonSource_imgs_exifs_3_6 = new ol.source.Vector({
    attributions: ' ',
});
jsonSource_imgs_exifs_3_6.addFeatures(features_imgs_exifs_3_6);
var lyr_imgs_exifs_3_6 = new ol.layer.Vector({
                declutter: true,
                source:jsonSource_imgs_exifs_3_6, 
                style: style_imgs_exifs_3_6,
                interactive: true,
                title: '<img src="styles/legend/imgs_exifs_3_6.png" /> imgs_exifs_3'
            });
var format_oferta_inmobiliariagrupo_2_7 = new ol.format.GeoJSON();
var features_oferta_inmobiliariagrupo_2_7 = format_oferta_inmobiliariagrupo_2_7.readFeatures(json_oferta_inmobiliariagrupo_2_7, 
            {dataProjection: 'EPSG:4326', featureProjection: 'EPSG:3857'});
var jsonSource_oferta_inmobiliariagrupo_2_7 = new ol.source.Vector({
    attributions: ' ',
});
jsonSource_oferta_inmobiliariagrupo_2_7.addFeatures(features_oferta_inmobiliariagrupo_2_7);
var lyr_oferta_inmobiliariagrupo_2_7 = new ol.layer.Vector({
                declutter: true,
                source:jsonSource_oferta_inmobiliariagrupo_2_7, 
                style: style_oferta_inmobiliariagrupo_2_7,
                interactive: true,
    title: 'oferta_inmobiliaria — grupo_2<br />\
    <img src="styles/legend/oferta_inmobiliariagrupo_2_7_0.png" /> apartamento<br />\
    <img src="styles/legend/oferta_inmobiliariagrupo_2_7_1.png" /> casa<br />\
    <img src="styles/legend/oferta_inmobiliariagrupo_2_7_2.png" /> <br />'
        });
var format_Enventa_8 = new ol.format.GeoJSON();
var features_Enventa_8 = format_Enventa_8.readFeatures(json_Enventa_8, 
            {dataProjection: 'EPSG:4326', featureProjection: 'EPSG:3857'});
var jsonSource_Enventa_8 = new ol.source.Vector({
    attributions: ' ',
});
jsonSource_Enventa_8.addFeatures(features_Enventa_8);
var lyr_Enventa_8 = new ol.layer.Vector({
                declutter: true,
                source:jsonSource_Enventa_8,
maxResolution:1.1204586907520009,
 
                style: style_Enventa_8,
                interactive: true,
    title: 'En venta<br />\
    <img src="styles/legend/Enventa_8_0.png" /> Apartamento<br />\
    <img src="styles/legend/Enventa_8_1.png" /> Casa<br />'
        });

        var lyr_CartoDbPositron_9 = new ol.layer.Tile({
            'title': 'CartoDb Positron',
            'type': 'base',
            'opacity': 1.000000,
            
            
            source: new ol.source.XYZ({
    attributions: ' ',
                url: 'http://basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png'
            })
        });
var group_OFERTAINMOBILIARIA = new ol.layer.Group({
                                layers: [lyr_imgs_exifs_2_4,lyr_oferta_inmobiliariagrupo_1_5,lyr_imgs_exifs_3_6,lyr_oferta_inmobiliariagrupo_2_7,lyr_Enventa_8,],
                                title: "OFERTA INMOBILIARIA"});
var group_TMP = new ol.layer.Group({
                                layers: [lyr_imgs_exifs_2_4,lyr_oferta_inmobiliariagrupo_1_5,lyr_imgs_exifs_3_6,lyr_oferta_inmobiliariagrupo_2_7,],
                                title: "TMP"});

lyr_imgs_exifs_2_0.setVisible(true);lyr_oferta_inmobiliariagrupo_1_1.setVisible(true);lyr_imgs_exifs_3_2.setVisible(true);lyr_oferta_inmobiliariagrupo_2_3.setVisible(true);lyr_imgs_exifs_2_4.setVisible(true);lyr_oferta_inmobiliariagrupo_1_5.setVisible(true);lyr_imgs_exifs_3_6.setVisible(true);lyr_oferta_inmobiliariagrupo_2_7.setVisible(true);lyr_Enventa_8.setVisible(true);lyr_CartoDbPositron_9.setVisible(true);
var layersList = [group_TMP,group_OFERTAINMOBILIARIA,lyr_CartoDbPositron_9];
lyr_imgs_exifs_2_0.set('fieldAliases', {'id': 'id', 'SourceFile': 'SourceFile', 'GPSLatitude': 'GPSLatitude', 'GPSLongitude': 'GPSLongitude', });
lyr_oferta_inmobiliariagrupo_1_1.set('fieldAliases', {'fid': 'fid', 'id': 'id', 'SourceFile': 'SourceFile', 'GPSLatitude': 'GPSLatitude', 'GPSLongitude': 'GPSLongitude', 'tipo': 'tipo', });
lyr_imgs_exifs_3_2.set('fieldAliases', {'field_1': 'field_1', 'SourceFile': 'SourceFile', 'GPSLatitude': 'GPSLatitude', 'GPSLongitude': 'GPSLongitude', });
lyr_oferta_inmobiliariagrupo_2_3.set('fieldAliases', {'fid': 'fid', 'field_1': 'field_1', 'SourceFile': 'SourceFile', 'GPSLatitude': 'GPSLatitude', 'GPSLongitude': 'GPSLongitude', 'tipo': 'tipo', });
lyr_imgs_exifs_2_4.set('fieldAliases', {'id': 'id', 'SourceFile': 'SourceFile', 'GPSLatitude': 'GPSLatitude', 'GPSLongitude': 'GPSLongitude', });
lyr_oferta_inmobiliariagrupo_1_5.set('fieldAliases', {'fid': 'fid', 'id': 'id', 'SourceFile': 'SourceFile', 'GPSLatitude': 'GPSLatitude', 'GPSLongitude': 'GPSLongitude', 'tipo': 'tipo', });
lyr_imgs_exifs_3_6.set('fieldAliases', {'field_1': 'field_1', 'SourceFile': 'SourceFile', 'GPSLatitude': 'GPSLatitude', 'GPSLongitude': 'GPSLongitude', });
lyr_oferta_inmobiliariagrupo_2_7.set('fieldAliases', {'fid': 'fid', 'field_1': 'field_1', 'SourceFile': 'SourceFile', 'GPSLatitude': 'GPSLatitude', 'GPSLongitude': 'GPSLongitude', 'tipo': 'tipo', });
lyr_Enventa_8.set('fieldAliases', {'fid': 'fid', 'SourceFile': 'SourceFile', 'GPSLatitude': 'Latitud', 'GPSLongitude': 'Longitud', 'tipo': 'Tipo', 'oferta_id': 'oferta_id', 'info_contacto': 'Contacto', 'info_adic': 'Descripción', 'img_http': 'img_http', });
lyr_imgs_exifs_2_0.set('fieldImages', {'id': '', 'SourceFile': '', 'GPSLatitude': '', 'GPSLongitude': '', });
lyr_oferta_inmobiliariagrupo_1_1.set('fieldImages', {'fid': 'TextEdit', 'id': 'Range', 'SourceFile': 'TextEdit', 'GPSLatitude': 'TextEdit', 'GPSLongitude': 'TextEdit', 'tipo': 'TextEdit', });
lyr_imgs_exifs_3_2.set('fieldImages', {'field_1': '', 'SourceFile': '', 'GPSLatitude': '', 'GPSLongitude': '', });
lyr_oferta_inmobiliariagrupo_2_3.set('fieldImages', {'fid': 'TextEdit', 'field_1': 'Range', 'SourceFile': 'TextEdit', 'GPSLatitude': 'TextEdit', 'GPSLongitude': 'TextEdit', 'tipo': '', });
lyr_imgs_exifs_2_4.set('fieldImages', {'id': '', 'SourceFile': '', 'GPSLatitude': '', 'GPSLongitude': '', });
lyr_oferta_inmobiliariagrupo_1_5.set('fieldImages', {'fid': 'TextEdit', 'id': 'Range', 'SourceFile': 'TextEdit', 'GPSLatitude': 'TextEdit', 'GPSLongitude': 'TextEdit', 'tipo': 'TextEdit', });
lyr_imgs_exifs_3_6.set('fieldImages', {'field_1': '', 'SourceFile': '', 'GPSLatitude': '', 'GPSLongitude': '', });
lyr_oferta_inmobiliariagrupo_2_7.set('fieldImages', {'fid': 'TextEdit', 'field_1': 'Range', 'SourceFile': 'TextEdit', 'GPSLatitude': 'TextEdit', 'GPSLongitude': 'TextEdit', 'tipo': '', });
lyr_Enventa_8.set('fieldImages', {'fid': 'TextEdit', 'SourceFile': 'Hidden', 'GPSLatitude': 'TextEdit', 'GPSLongitude': 'TextEdit', 'tipo': 'TextEdit', 'oferta_id': 'Range', 'info_contacto': 'TextEdit', 'info_adic': 'TextEdit', 'img_http': 'TextEdit', });
lyr_imgs_exifs_2_0.set('fieldLabels', {});
lyr_oferta_inmobiliariagrupo_1_1.set('fieldLabels', {});
lyr_imgs_exifs_3_2.set('fieldLabels', {});
lyr_oferta_inmobiliariagrupo_2_3.set('fieldLabels', {});
lyr_imgs_exifs_2_4.set('fieldLabels', {});
lyr_oferta_inmobiliariagrupo_1_5.set('fieldLabels', {});
lyr_imgs_exifs_3_6.set('fieldLabels', {});
lyr_oferta_inmobiliariagrupo_2_7.set('fieldLabels', {});
lyr_Enventa_8.set('fieldLabels', {});
lyr_Enventa_8.on('precompose', function(evt) {
    evt.context.globalCompositeOperation = 'normal';
});